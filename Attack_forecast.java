package graduation_work;

import java.awt.BorderLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

public class Attack_forecast extends JPanel implements ActionListener {

	JLabel label1 = new JLabel("ボタンを押してください");

	int n = 0;
	int NAB[] = new int[9];
	int NCAB[][] = new int[9][3];
	int AB[] = new int[2];

	int i;
	double ProPunch = 0, ProLowKick = 0, ProHighKick = 0;

	JButton punch_btn = new JButton("Punch");
	JButton lowkick_btn = new JButton("LowKick");
	JButton highkick_btn = new JButton("HighKick");

	public static void main(String[] args) {
		JFrame frame = new JFrame("WorkTime");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		Attack_forecast af = new Attack_forecast();
		frame.add(af, BorderLayout.CENTER);
		frame.setSize(800, 200);
		// frame.pack();
		frame.setVisible(true);
	}

	public Attack_forecast() {
		JPanel pBox = new JPanel();
		pBox.setLayout(new BoxLayout(pBox, BoxLayout.Y_AXIS));
		pBox.add(label1);

		JPanel pBox2 = new JPanel();
		pBox2.setLayout(new BoxLayout(pBox2, BoxLayout.X_AXIS));
		pBox2.add(punch_btn);
		pBox2.add(lowkick_btn);
		pBox2.add(highkick_btn);

		pBox.add(pBox2);

		add(pBox, BorderLayout.CENTER);

		punch_btn.addActionListener(this);
		lowkick_btn.addActionListener(this);
		highkick_btn.addActionListener(this);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		n++;
		if (n % 3 == 0) {
			if (AB[0] == 1 && AB[1] == 1)
				i = 0;
			if (AB[0] == 1 && AB[1] == 2)
				i = 1;
			if (AB[0] == 1 && AB[1] == 3)
				i = 2;
			if (AB[0] == 2 && AB[1] == 1)
				i = 3;
			if (AB[0] == 2 && AB[1] == 2)
				i = 4;
			if (AB[0] == 2 && AB[1] == 3)
				i = 5;
			if (AB[0] == 3 && AB[1] == 1)
				i = 6;
			if (AB[0] == 3 && AB[1] == 2)
				i = 7;
			if (AB[0] == 3 && AB[1] == 3)
				i = 8;
		}
		if (e.getSource() == punch_btn) {
			System.out.println("punch");
			if (n % 3 == 1) {
				AB[0] = 1;
			} else if (n % 3 == 2) {
				AB[1] = 1;
			} else if (n % 3 == 0)
				NCAB[i][0]++;
		}
		if (e.getSource() == lowkick_btn) {
			System.out.println("lowkick");
			if (n % 3 == 1) {
				AB[0] = 2;
			} else if (n % 3 == 2) {
				AB[1] = 2;
			} else if (n % 3 == 0)
				NCAB[i][1]++;
		}
		if (e.getSource() == highkick_btn) {
			System.out.println("highkick");
			if (n % 3 == 1) {
				AB[0] = 3;
			} else if (n % 3 == 2) {
				AB[1] = 3;
			} else if (n % 3 == 0)
				NCAB[i][2]++;
		}

		if (n % 3 == 1)
			label1.setText("1回目");
		else if (n % 3 == 2)
			label1.setText("2回目");
		else if (n % 3 == 0) {

			NAB[i]++;

			if (NAB[i] > 0) {
				ProPunch = (double) NCAB[i][0] / (double) NAB[i];
				ProLowKick = (double) NCAB[i][1] / (double) NAB[i];
				ProHighKick = (double) NCAB[i][2] / (double) NAB[i];
			}

			label1.setText(
					String.valueOf(ProPunch) + " " + String.valueOf(ProLowKick) + " " + String.valueOf(ProHighKick));

			System.out.println("------------------------");
		}
	}
}
