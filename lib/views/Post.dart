import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  final String caption = 'Những cánh hoa mỏng manh rực rỡ, khoe sắc lung linh như nắng sớm, khiến lòng người say đắm và mê mẩn.';
  final String AvatarUrl ='https://i.pinimg.com/564x/23/a2/af/23a2afc145916eb61ce3b45c20efaa5b.jpg';
  final String ImageUrl ='https://i.pinimg.com/564x/23/a2/af/23a2afc145916eb61ce3b45c20efaa5b.jpg';
  final String name = 'Nguyễn Văn A';
  final String time = '1 Giờ';
  final String like = '5';
  final String comment = '10';
  final String share = '5';

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey[500]!, // Màu của viền
            width: 2.0, // Độ dày của viền
          ),
        ),
      ),
      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(widget.AvatarUrl),
                  backgroundColor: Colors.grey[200],
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.name, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                  Row(
                    children: [
                      Icon(Icons.access_alarm, size: 20),
                      Text(widget.time, style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 10, 0),
              child: Text(
                widget.caption,
                style: TextStyle(fontSize: 16),
                maxLines: _isExpanded ? null : 2,
                overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(height: 10),
          if (!_isExpanded)
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      _isExpanded = true;
                    });
                  },
                  child: Text('Xem thêm', style: TextStyle(color: Colors.blue)),
                ),
              ),
            ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Container(
                width: double.infinity,
                height: 288,
                child: Image.network(
                  widget.ImageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                child: Row(
                  children: [
                    Icon(Icons.favorite_border_outlined, size: 25),
                    SizedBox(width: 5),
                    Text(widget.like, style: TextStyle(fontSize: 18)),
                    SizedBox(width: 5),
                    Text('Thích', style: TextStyle(fontSize: 18)),
                  ],
                ),
              ),
              SizedBox(width: 35),
              Row(
                children: [
                  Icon(Icons.mode_comment_outlined, size: 20),
                  SizedBox(width: 5),
                  Text(widget.comment, style: TextStyle(fontSize: 18)),
                  SizedBox(width: 5),
                  Text('Bình luận', style: TextStyle(fontSize: 18)),
                ],
              ),
              SizedBox(width: 35),
              Row(
                children: [
                  Icon(Icons.share_outlined, size: 20),
                  SizedBox(width: 5),
                  Text(widget.share, style: TextStyle(fontSize: 18)),
                  SizedBox(width: 5),
                  Text('Chia sẻ', style: TextStyle(fontSize: 18)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
