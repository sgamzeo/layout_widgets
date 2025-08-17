import 'package:layout_widgets/features/comedy_club/enums/enums.dart';

extension ComedyFormatExt on ComedyFormat {
  String get displayName {
    switch (this) {
      case ComedyFormat.standUp:
        return 'Stand-Up';
      case ComedyFormat.improv:
        return 'Improv';
      case ComedyFormat.roast:
        return 'Roast';
      case ComedyFormat.openMic:
        return 'Open Mic';
    }
  }

  String get description {
    switch (this) {
      case ComedyFormat.standUp:
        return 'Solo comedy performance with jokes and stories.';
      case ComedyFormat.improv:
        return 'Spontaneous comedy involving audience participation.';
      case ComedyFormat.roast:
        return 'Comedians humorously teasing each other.';
      case ComedyFormat.openMic:
        return 'Open stage for new talents to perform.';
    }
  }
}

extension TicketTierExt on TicketTier {
  String get perks {
    switch (this) {
      case TicketTier.standard:
        return 'Basic entry ticket.';
      case TicketTier.vip:
        return 'Front row seats and complimentary drinks.';
      case TicketTier.group:
        return 'Discounted tickets for groups of 4 or more.';
      case TicketTier.earlyBird:
        return 'Discount for early purchase.';
    }
  }
}

extension ShowTimeExt on ShowTime {
  String get displayTime {
    switch (this) {
      case ShowTime.evening:
        return '7:30 PM - 9:30 PM';
      case ShowTime.lateNight:
        return '10:30 PM - 12:30 AM';
      case ShowTime.weekend:
        return '4:00 PM - 11:30 PM';
      case ShowTime.happyHour:
        return '5:00 PM - 6:30 PM';
      case ShowTime.matinee:
        return '2:00 PM - 4:00 PM';
      case ShowTime.specialEvent:
        return '8:00 PM - 1:00 AM';
    }
  }
}

extension AudienceTypeExt on AudienceType {
  String get description {
    switch (this) {
      case AudienceType.allAges:
        return 'Content suitable for all age groups.';
      case AudienceType.adultOnly:
        return '18+ content, adult humor.';
      case AudienceType.couples:
        return 'Romantic and fun atmosphere.';
      case AudienceType.family:
        return 'Suitable for families with children.';
    }
  }
}
