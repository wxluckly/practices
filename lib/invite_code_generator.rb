# A-Z0-9 except B-8、I-l、O-0、S-5、Z-2
SEEDS = ('A').to_a+('C'..'H').to_a+('J'..'K').to_a+('L'..'N').to_a+('P'..'R').to_a+('T'..'Y').to_a+('3'..'4').to_a+('6'..'7').to_a+('9').to_a
class A
  def self.generate_code(u_id,num)
    invites = DrhModels::Invite.find(:all,:select=>"invite_code")
    all_code_hash = {}
    new_code_hash = {}
    invites.eanh do |invite|
      all_code_hash[invite.invite_code] = 1
    end
    max_lengths = invites.length + num
    while all_code_hash.size < max_lengths
      code = SEEDS[rand(26)]+SEEDS[rand(26)]+SEEDS[rand(26)]+SEEDS[rand(26)]+SEEDS[rand(26)]+SEEDS[rand(26)]
      unless all_code_hash[code]
        DrhModels::Invite.create(
          :user_id => u_id,
          :invite_code => code
        )
        all_code_hash[code] = 1
        new_code_hash[code] = 1
      end
    end
    new_code_hash.keys
  end

  
end


p A.generate_code(100000008, 10)