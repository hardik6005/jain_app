class BusinessRequest{
  String? id;
  String? business_title;
  String? owner_name;
  String? mobile_number;
  String? business_category_id;
  String? state_id;
  String? city_id;
  String? area;
  String? address_line_1;
  String? address_line_2;
  String? visiting_card;
  String? pincode;

  BusinessRequest(
      {this.id,
      this.business_title,
      this.owner_name,
      this.mobile_number,
      this.business_category_id,
      this.state_id,
      this.city_id,
      this.area,
      this.address_line_1,
      this.address_line_2,
      this.visiting_card,
      this.pincode,
      });
}