class TicketsModel {
  bool hasTickets = false;
  String ticketUrl = "";
  String ticketCurrency = "";
  int minTicketPrice = 0;
  int maxTicketPrice = 0;

  TicketsModel();

  TicketsModel.fromJson(Map<String, dynamic> json) {
    hasTickets = json['has_tickets'] ?? false;
    ticketUrl = json['ticket_url'] ?? "";
    ticketCurrency = json['ticket_currency'] ?? "";
    minTicketPrice = json['min_ticket_price'] ?? 0;
    maxTicketPrice = json['max_ticket_price'] ?? 0;
  }
}
