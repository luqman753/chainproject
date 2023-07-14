import 'package:list_treeview/tree/node/tree_node.dart';

class TreeNodeData extends NodeData {
  TreeNodeData({this.name, this.levelNumber, this.id, this.cnic,this.email,this.referenceCode,this.parentReference,this.balance,}) : super();

  
  final String? name;
  final int? levelNumber;
  final String? id;
  final String? cnic;
  final String? email;
  final String? referenceCode; 
  final String? parentReference;
  final int? balance;
  // DateTime createdAt;



  ///...
}
