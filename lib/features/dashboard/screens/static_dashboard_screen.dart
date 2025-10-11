import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class StaticDashboardScreen extends StatelessWidget {
  const StaticDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Government Schemes'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          _SchemeCard(
            title:
                'Ayushman Bharat Pradhan Mantri Jan Arogya Yojana (AB PM-JAY)',
            description:
                'AB PM-JAY is the largest health assurance scheme in the world, providing a health cover of Rs. 5 lakhs per family per year for secondary and tertiary care hospitalization to over 10.74 crore poor and vulnerable families.',
            benefits: [
              'Cashless cover of up to Rs. 5,00,000 per family per year.',
              'Covers all expenses including medical examination, treatment, consultation, pre-hospitalization, medicine, and post-hospitalization follow-up care up to 15 days.',
              'No cap on family size or age of members.',
              'Pre-existing diseases are covered from day one.',
            ],
            eligibility: [
              'Households with only one room with kucha walls and kucha roof.',
              'Households with no adult member between ages 16 to 59.',
              'Female-headed households with no adult male member between ages 16 to 59.',
              'Households with a disabled member and no able-bodied adult member.',
              'SC/ST households.',
              'Landless households deriving a major part of their income from manual casual labor.',
            ],
            url: 'https://pmjay.gov.in/',
          ),
          _SchemeCard(
            title: 'Pradhan Mantri Awaas Yojana - Gramin (PMAY-G)',
            description:
                'PMAY-G aims to provide a pucca house with basic amenities to all houseless households and those households living in kutcha and dilapidated houses in rural areas.',
            benefits: [
              'Financial assistance of ₹1,20,000 in plain areas and ₹1,30,000 in hilly areas.',
              'Beneficiaries can avail a loan of up to ₹70,000 from financial institutions.',
              'The minimum size of the house is 25 sq. m, including a dedicated area for hygienic cooking.',
            ],
            eligibility: [
              'Houseless households and households living in zero, one, or two-room houses with kutcha walls and kutcha roofs.',
              'Prioritization is given to households based on deprivation scores from the Socio-Economic and Caste Census (SECC) 2011.',
              '60% of funds are earmarked for SC/ST beneficiaries.',
            ],
            url: 'https://pmayg.nic.in/',
          ),
          _SchemeCard(
            title:
                'Deendayal Antyodaya Yojana - National Rural Livelihoods Mission (DAY-NRLM)',
            description:
                'This mission aims to reduce poverty by enabling poor households to access gainful self-employment and skilled wage employment opportunities, resulting in sustainable and diversified livelihood options.',
            benefits: [
              'Formation of Self Help Groups (SHGs) and their federations.',
              'Financial support in the form of Revolving Fund and Community Investment Fund.',
              'Interest subvention on loans to SHGs.',
              'Training and capacity building for livelihoods promotion.',
            ],
            eligibility: [
              'The mission targets the poorest of the poor, with a special focus on women.',
              'Identification of the poor is done through a participatory process.',
            ],
            url: 'https://aajeevika.gov.in/',
          ),
          _SchemeCard(
            title: 'Pradhan Mantri Anusuchit Jaati Abhyuday Yojna (PM-AJAY)',
            description:
                'A merged scheme of three Centrally Sponsored Schemes, namely Pradhan Mantri Adarsh Gram Yojana (PMAGY), Special Central Assistance to Scheduled Castes Sub Plan (SCA to SCSP), and Babu Jagjivan Ram Chhatrawas Yojana (BJRCY).',
            benefits: [
              'Grants-in-aid for infrastructure development in SC-dominated villages.',
              'Financial assistance for income-generating schemes and skill development.',
              'Construction of hostels for SC students.',
            ],
            eligibility: [
              'Villages with a Scheduled Caste population of 50% or more.',
              'Scheduled Caste persons living below the poverty line for income-generating and skill development programs.',
            ],
            url: 'https://pmajay.dosje.gov.in/',
          ),
        ],
      ),
    );
  }
}

class _SchemeCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> benefits;
  final List<String> eligibility;
  final String url;

  const _SchemeCard({
    required this.title,
    required this.description,
    required this.benefits,
    required this.eligibility,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(description),
            const SizedBox(height: 16.0),
            _buildSection('Key Benefits', benefits),
            const SizedBox(height: 16.0),
            _buildSection('Eligibility Criteria (Rural)', eligibility),
            const SizedBox(height: 16.0),
            _buildLink(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8.0),
        ...items.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('• '),
                Expanded(child: Text(item)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLink(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'For more information',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8.0),
        InkWell(
          onTap: () async {
            final uri = Uri.parse(url);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Could not launch $url'),
                ),
              );
            }
          },
          child: Text(
            url,
            style: const TextStyle(
              color: AppTheme.primaryColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
