import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Post extends StatefulWidget {
  final String caption = 'Những cánh hoa mỏng manh rực rỡ, khoe sắc lung linh như nắng sớm, khiến lòng người say đắm và mê mẩn.';
  final String avatarUrl ='https://i.pinimg.com/564x/23/a2/af/23a2afc145916eb61ce3b45c20efaa5b.jpg';
  final String imageUrl ='https://i.pinimg.com/564x/23/a2/af/23a2afc145916eb61ce3b45c20efaa5b.jpg';
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
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(widget.avatarUrl),
                  backgroundColor: Colors.grey[200],
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 20), // Đổi từ Icons.access_alarm thành Icons.access_time
                      Text(
                        widget.time,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                widget.caption,
                style: const TextStyle(fontSize: 16),
                maxLines: _isExpanded ? null : 2,
                overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
              ),
            ),
          ),
          if (!_isExpanded)
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _isExpanded = true;
                  });
                },
                child: const Text('Xem thêm', style: TextStyle(color: Colors.blue)),
              ),
            ),
          const SizedBox(height: 10),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8), // Thay đổi borderRadius để nhìn tinh tế hơn
              child: SizedBox(
                width: double.infinity,
                height: 288,
                child: Image.network(
                  widget.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionIcon(Icons.favorite_border_outlined, widget.like, 'Thích'),
              _buildActionIcon(Icons.mode_comment_outlined, widget.comment, 'Bình luận'),
              _buildActionIcon(Icons.share_outlined, widget.share, 'Chia sẻ'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, String count, String label) {
    return Row(
      children: [
        Icon(icon, size: 20),
        const SizedBox(width: 5),
        Text(count, style: const TextStyle(fontSize: 18)),
        const SizedBox(width: 5),
        Text(label, style: const TextStyle(fontSize: 18)),
      ],
    );
  }
}
