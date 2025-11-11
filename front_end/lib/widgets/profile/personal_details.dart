import 'package:flutter/material.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Age', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
                const Spacer(),
                Text(
                  '25 years',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black87,
                    fontSize: 16,                    
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text('Current weight', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
                const Spacer(),
                Text(
                  '200 lbs',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black87,
                    fontSize: 16,                    
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text('Target weight', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
                const Spacer(),
                Text(
                  '180 lbs',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black87,
                    fontSize: 16,                    
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text('Height', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
                const Spacer(),
                Text(
                  '6 ft 0 in',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black87,
                    fontSize: 16,                    
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text('Gender', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
                const Spacer(),
                Text(
                  'Male',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black87,
                    fontSize: 16,                    
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text('Activity level', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
                const Spacer(),
                Text(
                  'Moderately active',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black87,
                    fontSize: 16,                    
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text('Dietary preferences', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
                const Spacer(),
                Text(
                  'Vegetarian',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black87,
                    fontSize: 16,                    
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Text('Allergies', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
                const Spacer(),
                Text(
                  'Peanuts, Gluten',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.black87,
                    fontSize: 16,                    
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Action to edit personal details
                  },
                  icon: const Icon(Icons.edit, color: Color.fromARGB(255, 0, 0, 0),),
                  label: const Text('Edit Details', style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                  ),),
                ),
              ],
            ),

          ],

        ),
        
      ),
    );
  }
}