import 'package:flutter/material.dart';
import 'package:movieflex/datas/dummy.dart';

class DownloadSection extends StatefulWidget {
  const DownloadSection({super.key});

  @override
  State<DownloadSection> createState() => _DownloadSectionState();
}

class _DownloadSectionState extends State<DownloadSection> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(12),
      itemCount: movieDownload.length,
      itemBuilder: (context, index) {
        final item = movieDownload[index];

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 120,
                  height: 100,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        item["image"]!,
                        width: 120,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Container(color: Colors.black12),
                      const Icon(
                        Icons.play_circle_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Informations (Titre, Durée, Date)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item["name"]!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      item["time"]!,
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.shade600,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        item["date"]!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Bouton Supprimer
              IconButton(
                onPressed: () {
                  setState(() {
                    movieDownload.removeAt(index);
                  });
                },
                icon: const Icon(
                  Icons.delete_outlined,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
