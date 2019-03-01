# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create,
#     modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field
# names.


from django.db import models
from django.contrib.auth.models import UserManager, AbstractUser


class Permission(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)
    permissionname = models.CharField(db_column='PermissionName',
                                      max_length=255,
                                      blank=True,
                                      null=True)
    permissionactive = models.TextField(db_column='PermissionActive')
    create = models.TextField(db_column='Create')
    read = models.TextField(db_column='Read')
    update = models.TextField(db_column='Update')
    delete = models.TextField(db_column='Delete')
    read_others = models.TextField(db_column='Read_others')
    update_others = models.TextField(db_column='Update_others')

    class Meta:

        db_table = 'Permission'


class Profile(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)
    profilename = models.CharField(db_column='ProfileName',
                                   max_length=255,
                                   blank=True,
                                   null=True)
    active = models.TextField(db_column='Active')
    userid = models.IntegerField(db_column='UserID')

    class Meta:

        db_table = 'Profile'


class ProfilePermission(models.Model):
    profileid = models.ForeignKey(Profile,
                                  models.DO_NOTHING,
                                  db_column='ProfileID',
                                  primary_key=True,
                                  )
    permissionid = models.ForeignKey(Permission,
                                     models.DO_NOTHING,
                                     db_column='PermissionID')

    class Meta:

        db_table = 'Profile_Permission'
        unique_together = (('profileid', 'permissionid'),)


class Organization(models.Model):
    id = models.AutoField(db_column='ID',
                          primary_key=True)
    organizationname = models.CharField(db_column='OrganizationName',
                                        max_length=255,
                                        blank=True,
                                        null=True)
    organizationlocation = models.CharField(db_column='OrganizationLocation',
                                            max_length=255,
                                            blank=True,
                                            null=True)

    class Meta:

        db_table = 'Organization'


class UserManager(UserManager):
    pass


class User(AbstractUser):

    id = models.AutoField(db_column='ID', primary_key=True)

    username = models.CharField(db_column='UserName',
                                max_length=255,
                                blank=True,
                                unique=True,
                                null=True)
    useremail = models.CharField(db_column='UserEmail',
                                 max_length=255,
                                 blank=True,
                                 null=True)
    password = models.CharField(db_column='Password',
                                max_length=255,
                                blank=True,
                                null=True)
    userrole = models.CharField(db_column='UserRole',
                                max_length=255,
                                blank=True,
                                null=True)
    active = models.TextField(db_column='Active')

    objectj = UserManager()

    class Meta:

        db_table = 'User'
