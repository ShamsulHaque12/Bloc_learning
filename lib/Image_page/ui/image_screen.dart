import 'dart:io';

import 'package:counter_num_bloc/Image_page/bloc/image_bloc.dart';
import 'package:counter_num_bloc/Image_page/bloc/image_event.dart';
import 'package:counter_num_bloc/Image_page/bloc/image_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          'Capture & Select',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.blue.withOpacity(0.05)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImagePreview(),
              const SizedBox(height: 48),
              _buildActionButtons(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePreview() {
    return BlocBuilder<ImagePickerBloc, ImagePickerState>(
      builder: (context, state) {
        return Container(
          height: 320,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
            border: Border.all(color: Colors.blue.withOpacity(0.1), width: 2),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: state.image == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_search_rounded,
                        size: 80,
                        color: Colors.blue.withOpacity(0.3),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No Image Selected',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                : Image.file(File(state.image!.path), fit: BoxFit.cover),
          ),
        );
      },
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        _buildGradientButton(
          label: 'Capture from Camera',
          icon: Icons.camera_enhance_rounded,
          onPressed: () {
            context.read<ImagePickerBloc>().add(CameraCaptureRequested());
          },
          colors: [const Color(0xFF2196F3), const Color(0xFF1976D2)],
        ),
        const SizedBox(height: 16),
        _buildGradientButton(
          label: 'Select from Gallery',
          icon: Icons.photo_library_rounded,
          onPressed: () {
            context.read<ImagePickerBloc>().add(GalleryCaptureRequested());
          },
          colors: [const Color(0xFF4CAF50), const Color(0xFF388E3C)],
        ),
      ],
    );
  }

  Widget _buildGradientButton({
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
    required List<Color> colors,
  }) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colors.first.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.white),
        label: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
