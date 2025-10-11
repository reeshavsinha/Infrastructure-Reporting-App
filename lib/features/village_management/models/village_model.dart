class Village {
  final String id;
  final String name;
  final String block;
  final String district;
  final String state;
  final int population;
  final List<InfrastructureStatus> infrastructureStatus;

  Village({
    required this.id,
    required this.name,
    required this.block,
    required this.district,
    required this.state,
    required this.population,
    required this.infrastructureStatus,
  });

  factory Village.fromJson(Map<String, dynamic> json) {
    return Village(
      id: json['id'],
      name: json['name'],
      block: json['block'],
      district: json['district'],
      state: json['state'],
      population: json['population'],
      infrastructureStatus: (json['infrastructure_status'] as List)
          .map((statusJson) => InfrastructureStatus.fromJson(statusJson))
          .toList(),
    );
  }
}

class InfrastructureStatus {
  final String domain;
  final String value;

  InfrastructureStatus({required this.domain, required this.value});

  factory InfrastructureStatus.fromJson(Map<String, dynamic> json) {
    return InfrastructureStatus(
      domain: json['domain'],
      value: json['value'],
    );
  }
}
