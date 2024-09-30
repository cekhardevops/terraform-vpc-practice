resource "aws_vpc_peering_connection" "main" {
  count = var.is_peering_required ? 1 : 0
  peer_vpc_id   = data.aws_vpc.default_vpc_info.id
  vpc_id        = aws_vpc.main.id
  auto_accept   = true

  tags =  merge(
    var.common_tags,
    var.database_route_table_tags,
    {
        Name = "${local.resource_name}-default"
    }
  )
}
resource "aws_route" "public_default" {
  count = var.is_peering_required ? 1 : 0
  route_table_id            = aws_route_table.public.id
  destination_cidr_block    = data.aws_vpc.default_vpc_info.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main[count.index].id
}

resource "aws_route" "private_default" {
  count = var.is_peering_required ? 1 : 0
  route_table_id = aws_route_table.private.id
  destination_cidr_block = data.aws_vpc.default_vpc_info.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main[count.index].id
}

resource "aws_route" "database_default" {
  count = var.is_peering_required ? 1 : 0
  route_table_id = aws_route_table.database.id
  destination_cidr_block = data.aws_vpc.default_vpc_info.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main[count.index].id
}

resource "aws_route" "default_expense" {
  count = var.is_peering_required ? 1 : 0
  route_table_id = data.aws_route_table.main.route_table_id
  destination_cidr_block = aws_vpc.main.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.main[count.index].id
}