package openflow

import (
	"github.com/kandoo/beehive-netctrl/nom"
	"github.com/kandoo/beehive-netctrl/openflow/of12"
	"github.com/kandoo/beehive-netctrl/openflow/of13"
)

func (d *of12Driver) handleRoleReply(r of12.RoleReply, c *ofConn) error {
	var role nom.DriverRole
	switch of12.ControllerRole(r.Role()) {
	case of12.ROLE_EQUAL:
		role = nom.DriverRoleDefault
	case of12.ROLE_MASTER:
		role = nom.DriverRoleMaster
	case of12.ROLE_SLAVE:
		role = nom.DriverRoleSlave
	}

	c.ctx.Emit(nom.DriverRoleUpdate{
		Node: c.node.UID(),
		Driver: nom.Driver{
			BeeID: c.ctx.ID(),
			Role:  role,
		},
		Generation: r.GenerationId(),
	})
	return nil
}

func (d *of13Driver) handleRoleReply(r of13.RoleReply, c *ofConn) error {
	var role nom.DriverRole
	switch of13.ControllerRole(r.Role()) {
	case of13.ROLE_EQUAL:
		role = nom.DriverRoleDefault
	case of13.ROLE_MASTER:
		role = nom.DriverRoleMaster
	case of13.ROLE_SLAVE:
		role = nom.DriverRoleSlave
	}

	c.ctx.Emit(nom.DriverRoleUpdate{
		Node: c.node.UID(),
		Driver: nom.Driver{
			BeeID: c.ctx.ID(),
			Role:  role,
		},
		Generation: r.GenerationId(),
	})
	return nil
}
