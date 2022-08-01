package bdlab;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

public class DBTest {
	public static class Material{
		private int Mat_C;

		private String Materail_name;

		public int getMat_C() {
			return Mat_C;
		}

		public void setMat_C(int mat_C) {
			Mat_C = mat_C;
		}

		public String getMaterail_name() {
			return Materail_name;
		}

		public void setMaterail_name(String materail_name) {
			Materail_name = materail_name;
		}

		@Override
		public int hashCode() {
			final int prime = 31;
			int result = 1;
			result = prime * result + Mat_C;
			result = prime * result + ((Materail_name == null) ? 0 : Materail_name.hashCode());
			return result;
		}

		@Override
		public boolean equals(Object obj) {
			if (this == obj)
				return true;
			if (obj == null)
				return false;
			if (getClass() != obj.getClass())
				return false;
			Material other = (Material) obj;
			if (Mat_C != other.Mat_C)
				return false;
			if (Materail_name == null) {
				if (other.Materail_name != null)
					return false;
			} else if (!Materail_name.equals(other.Materail_name))
				return false;
			return true;
		}

		@Override
		public String toString() {
			return "Material [Mat_C=" + Mat_C + ", Materail_name=" + Materail_name + "]";
		}

		public Material(int mat_C, String materail_name) {
			super();
			Mat_C = mat_C;
			Materail_name = materail_name;
		}

		public Material() {
			super();
			// TODO Auto-generated constructor stub
		}

	}
	
	public final static ResultSetToBean<Material> MaterialConverter = new ResultSetToBean<Material>() {
		public Material convert(ResultSet rs) throws Exception {
			Material e = new Material();
			e.setMat_C(rs.getInt("Mat_C"));
			e.setMaterail_name(rs.getString("Materail_name"));
			return e;
		}
	};
	
	
	//Update
		public static void main(String[] args) {

			boolean result = DBManager.run(new Task<Boolean>() {
				public Boolean execute(PreparedStatement ps) throws Exception {
					ps.setString(1, "Special44");
					ps.setInt(2, 9);
					return ps.executeUpdate() > 0;
				}
			}, "update Material set Materail_name = ? where Mat_C = ?");
			
			System.out.println(result ? "Udalo sie" : "Nie udalo sie");
			
	//Delete
		    boolean resultDelete = DBManager.run(new Task<Boolean>() {
				public Boolean execute(PreparedStatement ps) throws Exception {
					ps.setInt(1, 6);
					return ps.executeUpdate() > 0;
				}
			}, "delete from Material where Mat_C = ?");

		//	System.out.println(resultDelete ? "Udalo sie" : "Nie udalo sie");
			
			
	//Insert
			boolean resultInsert = DBManager.run(new Task<Boolean>() {
				public Boolean execute(PreparedStatement ps) throws Exception {
					ps.setInt(1, 11);
					ps.setString(2, "Jeniss");
					

					return ps.executeUpdate() > 0;
				}
			}, "insert into Material (Mat_C,Materail_name) values (?,?)");
			
	  //      System.out.println(resultInsert ? "Udalo sie" : "Nie udalo sie");
			
			
			

			List<Material> employees = DBManager
					.run(new Query() {
						public void prepareQuery(PreparedStatement ps)
								throws Exception {
							ps.setInt(1, 7);
						}
					}, MaterialConverter,
							"select Mat_C, Materail_name from Material where Mat_C = ?");

			for (Material e: employees) {
				System.out.println(e);
			}
		}

	}

		

	
	
	
		
