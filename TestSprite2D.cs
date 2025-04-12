using Godot;

public partial class TestSprite2D : Sprite2D
{
	private int _speed = 400;
	private float _angularSpeed = Mathf.Pi;

	public override void _Process(double delta)
	{
		var velocity = Vector2.Up.Rotated(Rotation) * _speed;

		Rotation += _angularSpeed * (float)delta;
		Position += velocity * (float)delta;
	}
}
