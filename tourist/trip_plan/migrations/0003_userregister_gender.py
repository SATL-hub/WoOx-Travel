# Generated by Django 2.0.9 on 2025-03-22 06:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('trip_plan', '0002_state_image1'),
    ]

    operations = [
        migrations.AddField(
            model_name='userregister',
            name='gender',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
    ]
