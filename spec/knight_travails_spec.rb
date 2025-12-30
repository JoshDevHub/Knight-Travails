require_relative "../lib/knight_travails"

# NOTE: TDDing the paths becomes complicated by the fact that there are usually multiple
#   routes a knight can take between two positions. The exact route that gets created will
#   depend on trivial implementation details (ie. the queue order of adjacent vertices). We
#   don't want our tests to care about that. We only care that the generated route strictly
#   contains knight moves. With that in mind, this custom matcher checks that a path is made
#   up of knight moves. This is done by iterating pairwise through the path and checking
#   the row and column values conform to the knight's move pattern.
#
RSpec::Matchers.define :be_all_knight_moves do
  match do |path|
    path.each_cons(2).all? do |a, b|
      diff = a.zip(b).map { |(v1, v2)| (v1 - v2).abs }
      [[2, 1], [1, 2]].include?(diff)
    end
  end
end

RSpec.describe KnightTravails do
  describe "#knight_moves" do
    subject(:path) { described_class.knight_moves(start, target) }

    context "when given the same start and target" do
      let(:start) { [3, 3] }
      let(:target) { [3, 3] }

      it "contains only one element matching the starting position" do
        expect(path).to contain_exactly([3, 3])
      end
    end

    context "when the start and target are a single move apart" do
      let(:start) { [0, 0] }
      let(:target) { [1, 2] }

      it "returns a route only containing both of the positions" do
        expect(path).to contain_exactly([0, 0], [1, 2])
      end
    end

    context "when given the start [0, 0] and the target [7, 7]" do
      let(:start) { [0, 0] }
      let(:target) { [7, 7] }

      it "has a 7 length route" do
        expect(path.length).to be 7
      end

      it "returns a route containing all knight moves" do
        expect(path).to be_all_knight_moves
      end
    end

    context "when given the start [0, 0] and the target [3, 3]" do
      let(:start) { [0, 0] }
      let(:target) { [3, 3] }

      it "has a 3 length route" do
        expect(path.length).to be 3
      end

      it "returns a route containing all knight moves" do
        expect(path).to be_all_knight_moves
      end
    end

    context "when given the start [3, 3] and the target [0, 0]" do
      let(:start) { [3, 3] }
      let(:target) { [0, 0] }

      it "has a 3 length route" do
        expect(path.length).to be 3
      end

      it "returns a route containing all knight moves" do
        expect(path).to be_all_knight_moves
      end
    end

    context "when given an invalid starting coordinate" do
      let(:start) { [-1, 0] }
      let(:target) { [0, 0] }

      it "raises an error" do
        expect { path }
          .to raise_error(KnightTravails::Position::InvalidPositionError)
          .with_message("Position values must be integers between the range of 0 and 7")
      end
    end

    context "when given an invalid target coordinate" do
      let(:start) { [0, 0] }
      let(:target) { [7, 8] }

      it "raises an error" do
        expect { path }
          .to raise_error(KnightTravails::Position::InvalidPositionError)
          .with_message("Position values must be integers between the range of 0 and 7")
      end
    end
  end
end
