"""empty message

Revision ID: 0b8465998dce
Revises: 70768bcf4c73
Create Date: 2020-04-23 17:47:13.900315

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '0b8465998dce'
down_revision = '70768bcf4c73'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('user', sa.Column('email', sa.String(), nullable=True))
    op.add_column('user', sa.Column('password', sa.String(length=256), nullable=True))
    op.add_column('user', sa.Column('slug', sa.String(), nullable=True))
    op.add_column('user', sa.Column('username', sa.String(), nullable=True))
    op.create_unique_constraint(None, 'user', ['username'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'user', type_='unique')
    op.drop_column('user', 'username')
    op.drop_column('user', 'slug')
    op.drop_column('user', 'password')
    op.drop_column('user', 'email')
    # ### end Alembic commands ###
