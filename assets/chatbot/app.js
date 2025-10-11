document.addEventListener("DOMContentLoaded", () => {
    const app = new CivicReportApp();
    app.init();
});

class CivicReportApp {
    constructor() {
        // --- DOM Elements ---
        this.chatInput = document.querySelector(".chat-input textarea");
        this.sendChatBtn = document.querySelector(".chat-input span");
        this.chatbox = document.querySelector(".chatbox");

        // --- Properties ---
        // WARNING: Storing API keys client-side is not secure.
        // This is for demonstration purposes only.
        this.GEMINI_API_KEY = "PASTE_YOUR_VALID_GEMINI_API_KEY_HERE";
        
        this.userMessage = null;
        this.inputInitHeight = this.chatInput.scrollHeight;
        this.chatHistory = [];
    }

    init() {
        this.setupEventListeners();
        this.addInitialMessage();
    }

    setupEventListeners() {
        this.sendChatBtn.addEventListener("click", () => this.handleChatMessage());
        this.chatInput.addEventListener("input", () => {
            // Adjust textarea height dynamically
            this.chatInput.style.height = `${this.inputInitHeight}px`;
            this.chatInput.style.height = `${this.chatInput.scrollHeight}px`;
        });
        this.chatInput.addEventListener("keydown", (e) => {
            // Send message on Enter key press
            if (e.key === "Enter" && !e.shiftKey) {
                e.preventDefault();
                this.handleChatMessage();
            }
        });
    }

    addInitialMessage() {
        const initialMessage = "Hi there 👋\nHow can I help you today?";
        this.appendMessage(initialMessage, "incoming");
        // Add system message to history to set the context for the AI
        this.chatHistory.push({
            role: "user",
            parts: [{ text: "You are a helpful assistant for a civic issues reporting app." }]
        });
        this.chatHistory.push({
            role: "model",
            parts: [{ text: initialMessage }]
        });
    }

    appendMessage(message, type) {
        const chatLi = document.createElement("li");
        chatLi.classList.add("chat", type);
        const p = document.createElement("p");
        p.textContent = message;
        chatLi.appendChild(p);
        this.chatbox.appendChild(chatLi);
        this.chatbox.scrollTo(0, this.chatbox.scrollHeight);
        return chatLi;
    }

    async handleChatMessage() {
        this.userMessage = this.chatInput.value.trim();
        if (!this.userMessage) return;

        // Clear input and reset height
        this.chatInput.value = "";
        this.chatInput.style.height = `${this.inputInitHeight}px`;

        // Display user's message
        this.appendMessage(this.userMessage, "outgoing");
        this.chatHistory.push({ role: "user", parts: [{ text: this.userMessage }] });

        // Show "Thinking..." message
        const thinkingLi = this.appendMessage("Thinking...", "incoming");

        try {
            const responseText = await this.getGeminiResponse(this.userMessage);
            thinkingLi.querySelector("p").textContent = responseText;
            this.chatHistory.push({ role: "model", parts: [{ text: responseText }] });
        } catch (error) {
            thinkingLi.querySelector("p").textContent = `Error: ${error.message}`;
            thinkingLi.querySelector("p").style.color = "red";
        }
    }

    async getGeminiResponse(prompt) {
    // 1. Safety check for the API key.
    if (!this.GEMINI_API_KEY || this.GEMINI_API_KEY === "PASTE_YOUR_VALID_GEMINI_API_KEY_HERE") {
        throw new Error("Gemini API key is not configured. Please add your key to app.js.");
    }

    const MODEL_TO_USE = 'gemini-pro';
    const API_URL = `https://generativelanguage.googleapis.com/v1beta/models/${MODEL_TO_USE}:generateContent?key=${this.GEMINI_API_KEY}`;
    
    const requestBody = {
        contents: this.chatHistory,
    };

    const res = await fetch(API_URL, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify(requestBody),
    });

    if (!res.ok) {
        const errorBody = await res.json();
        throw new Error(`API Error: ${res.status} ${res.statusText} - ${errorBody.error.message}`);
    }
    
    const data = await res.json();
    
    if (!data.candidates || data.candidates.length === 0) {
        throw new Error("API returned no content, possibly due to safety filters.");
    }

    return data.candidates[0].content.parts[0].text;
    }
}
