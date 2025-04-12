using Godot;

public partial class TestSprite2D : Sprite2D
{
	private int _speed = 400;
	private float _angularSpeed = Mathf.Pi;

	public override void _Ready()
	{
		var timer = GetNode<Timer>("Timer");
		timer.Timeout += OnTimeout;
	}

	public override void _Process(double delta)
	{
		ChangePosition(delta);
		ChangeDirection(delta);
	}

	public void ChangePosition(double delta)
	{
		if (!Input.IsActionPressed("ui_up")) return;

		Vector2 velocity = Vector2.Up.Rotated(Rotation) * _speed;
		Position += velocity * (float)delta;
	}

	public void ChangeDirection(double delta)
	{
		int direction = 0;
		if (Input.IsActionPressed("ui_left")) direction = -1;
		else if (Input.IsActionPressed("ui_right")) direction = 1;

		Rotation += _angularSpeed * direction * (float)delta;
	}

	private void OnRequestingHoes()
	{
		SetProcess(!IsProcessing());
	}

	private void OnTimeout()
	{
		Visible = !Visible;
	}
}
