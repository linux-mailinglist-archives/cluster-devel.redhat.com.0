Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D576414AE
	for <lists+cluster-devel@lfdr.de>; Sat,  3 Dec 2022 08:28:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670052503;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sgypUxkQkP67Os5UtuUe+qhmW8uxaOAtaTk2LR4JqeU=;
	b=fF9LVdav6QAANGwQUJYE8p4gLXsKlGkVnlIAP31mE4oFRWWHiM2phJX6tGPPWaAkydMyp1
	0/eD0PIsCx+5z/Yn2LslZAslgYDxJgRteRKsDrFbnBokS+8jB/w+bx7QxGAI7kmwz0bt1Z
	HwaTtCmvFk8OkYgyaM9HMCgWdbdkVVo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-3Sj9cNhGPK6_XBeOC37KDw-1; Sat, 03 Dec 2022 02:28:15 -0500
X-MC-Unique: 3Sj9cNhGPK6_XBeOC37KDw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA033857FAB;
	Sat,  3 Dec 2022 07:28:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC743111CD38;
	Sat,  3 Dec 2022 07:28:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3232919465A8;
	Sat,  3 Dec 2022 07:28:10 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 70A1E1946587 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  3 Dec 2022 07:28:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 04AE44B3FE0; Sat,  3 Dec 2022 07:28:09 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F135B4B3FC8
 for <cluster-devel@redhat.com>; Sat,  3 Dec 2022 07:28:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6E6F3804514
 for <cluster-devel@redhat.com>; Sat,  3 Dec 2022 07:28:08 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com
 [45.249.212.255]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-nORi5ce3MZCPQlLSRqAWSQ-1; Sat, 03 Dec 2022 02:28:06 -0500
X-MC-Unique: nORi5ce3MZCPQlLSRqAWSQ-1
Received: from dggpemm500015.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NPLx20plSz15Myn;
 Sat,  3 Dec 2022 15:27:18 +0800 (CST)
Received: from [10.174.177.133] (10.174.177.133) by
 dggpemm500015.china.huawei.com (7.185.36.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 3 Dec 2022 15:28:01 +0800
References: <20221201115032.3540859-1-bobo.shaobowang@huawei.com>
From: "Wangshaobo (bobo)" <bobo.shaobowang@huawei.com>
Message-ID: <5c66dbe3-5701-ba42-7933-73a31c2dc891@huawei.com>
Date: Sat, 3 Dec 2022 15:28:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20221201115032.3540859-1-bobo.shaobowang@huawei.com>
X-Originating-IP: [10.174.177.133]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500015.china.huawei.com (7.185.36.181)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] [RFC PATCH] gfs2: Fix missing cleanup quota in
 gfs2_put_super()
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
 <mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/cluster-devel/>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
 <mailto:cluster-devel-request@redhat.com?subject=subscribe>
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 cluster-devel@redhat.com, liwei391@huawei.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: quoted-printable



=D4=DA 2022/12/1 19:50, Wang ShaoBo =D0=B4=B5=C0:
> syzbot has reported an interesting issue:
>=20
> INFO: task syz-executor888:3126 blocked for more than 143 seconds.
>        Not tainted 6.1.0-rc6-syzkaller-32662-g6d464646530f #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz-executor888 state:D stack:0     pid:3126  ppid:3124   flags:0x00=
000000
> Call trace:
>   __switch_to+0x180/0x298 arch/arm64/kernel/process.c:553
>   context_switch kernel/sched/core.c:5209 [inline]
>   __schedule+0x408/0x594 kernel/sched/core.c:6521
>   schedule+0x64/0xa4 kernel/sched/core.c:6597
>   schedule_timeout+0x108/0x1b4 kernel/time/timer.c:1935
>   gfs2_gl_hash_clear+0xd4/0x1b0 fs/gfs2/glock.c:2263
>   gfs2_put_super+0x318/0x390 fs/gfs2/super.c:620
>   generic_shutdown_super+0x94/0x198 fs/super.c:492
>   kill_block_super+0x30/0x78 fs/super.c:1428
>   gfs2_kill_sb+0x68/0x78
>   deactivate_locked_super+0x70/0xe8 fs/super.c:332
>   deactivate_super+0xd0/0xd4 fs/super.c:363
>   cleanup_mnt+0x184/0x1c0 fs/namespace.c:1186
>   __cleanup_mnt+0x20/0x30 fs/namespace.c:1193
>   task_work_run+0x100/0x148 kernel/task_work.c:179
>   resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
>   do_notify_resume+0x174/0x1f0 arch/arm64/kernel/signal.c:1127
>   prepare_exit_to_user_mode arch/arm64/kernel/entry-common.c:137 [inline]
>   exit_to_user_mode arch/arm64/kernel/entry-common.c:142 [inline]
>   el0_svc+0x9c/0x150 arch/arm64/kernel/entry-common.c:638
>   el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
>   el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584
>=20
> Showing all locks held in the system:
> 1 lock held by rcu_tasks_kthre/11:
>   #0: ffff80000d4a4768 (rcu_tasks.tasks_gp_mutex){+.+.}-{3:3}, at: rcu_ta=
sks_one_gp+0x3c/0x450 kernel/rcu/tasks.h:507
> 1 lock held by rcu_tasks_trace/12:
>   #0: ffff80000d4a4db8 (rcu_tasks_trace.tasks_gp_mutex){+.+.}-{3:3}, at: =
rcu_tasks_one_gp+0x3c/0x450 kernel/rcu/tasks.h:507
> 1 lock held by khungtaskd/27:
>   #0: ffff80000d4a4640 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire+=
0x4/0x48 include/linux/rcupdate.h:303
> 2 locks held by getty/2759:
>   #0: ffff0000c7d7e098 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_w=
ait+0x28/0x58 drivers/tty/tty_ldisc.c:244
>   #1: ffff80000f6be2f0 (&ldata->atomic_read_lock){+.+.}-{3:3}, at: n_tty_=
read+0x19c/0x89c drivers/tty/n_tty.c:2177
> 1 lock held by syz-executor888/3126:
>   #0: ffff0000cae680e0 (&type->s_umount_key#41){+.+.}-{3:3}, at: deactiva=
te_super+0xc8/0xd4 fs/super.c:362
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> One task blocked after executing gfs2_gl_hash_clear(), it looks
> like go to sleep for waiting the condition (&sdp->sd_glock_disposal =3D=
=3D 0),
> this field sd_glock_disposal is used to count the getting times
> that calling gfs2_glock_get() success, In most cases, when we operate
> the mount interface, we will finally call this function:
>=20
>                                do_mount()
>                                path_mount()
>                                vfs_get_tree()
>                                gfs2_get_tree()
>                                get_tree_bdev()
>                                gfs2_fill_super()
>                       ________ init_inodes()_____________
>                      V                                   V
>         gfs2_lookup_simple()                         gfs2_rindex_update()
>         gfs2_lookupi()                               gfs2_ri_update()
>         gfs2_dir_search()                         -> read_rindex_entry() =
//*gfs2_rgrpd->rd_gl
>      -> gfs2_inode_lookup() //*gfs2_inode->i_gl  |__ gfs2_glock_get()
>     |__gfs2_glock_get()
>=20
> Correspondingly, release this glock's reference and decrease
> sdp->sd_glock_disposal through this path when umount:
>=20
>                                cleanup_mnt()
>                                deactivate_super()
>                                deactivate_locked_super()
>                                gfs2_kill_sb()
>                                kill_block_super()
>                                generic_shutdown_super()
>            _gfs2_rgrpd->rd_gl__gfs2_put_super()__gfs2_inode->i_gl__
>           V                                                        V
> =09gfs2_clear_rgrpd()                           gfs2_put_super()
> =09gfs2_glock_put()                             iput()
>          gfs2_glock_free()                            evict()
>                                                       gfs2_evict_inode()
>                                                       gfs2_glock_put_even=
tually()
>                                                       gfs2_glock_put()
>                                                       gfs2_glock_free()
>=20
> But if calling reconfigure_super() from sysfs between mount and umount,
> this path will also take the glock lock and increase sdp->sd_glock_dispos=
al
> as it also call gfs2_glock_get():
>=20
>     reconfigure_super()
>      gfs2_reconfigure()
>        gfs2_make_fs_rw() //remount filesystem read-write
>         gfs2_quota_init()
>       -> qd_alloc()      //*gfs2_quota_data->qd_gl
>      |___ gfs2_glock_get()
>=20
> This relies on gfs2_quota_cleanup() that is eventually called by
> gfs2_make_fs_ro() to clean up but unfortunately the file system
> has not been remounted at this time, the condition (!sb_rdonly(sb))
> is false and gfs2_make_fs_ro() can not be called, ultimately makes
> sdp->sd_glock_disposal never be 0.
>=20
> This add calling gfs2_quota_cleanup() when this filesystem remains
> readOnly, in this case we don't need sync quota or other operation
> otherwise the filesystem was really remounted.
>=20
> But this modification will trigger this warning:
>=20
>     WARNING: CPU: 7 PID: 2595 at include/linux/backing-dev.h:246 __folio_=
mark_dirty+0x559/0x7b0
I paste wrong, the warning is:
gfs2: fsid=3Dmounts.0: warning: assertion "!qd->qd_change" failed at=20
function =3D gfs2_quota_cleanup, file =3D fs/gfs2/quota.c, line =3D 1474

qd->qd_change has been changed in gfs2_quota_init(), but it looks
we don't need to do anything before remounting the file system as=20
read-write.
>=20
> We can filter this warning with adding a parameter as it doesn't
> really make sense here.
>=20
> Fixes: 9e6e0a128bca ("GFS2: Merge mount.c and ops_super.c into super.c")
> Reported-by: syzbot+ed7d0f71a89e28557a77@syzkaller.appspotmail.com
> Signed-off-by: Wang ShaoBo <bobo.shaobowang@huawei.com>
> ---
>   fs/gfs2/super.c | 3 +++
>   1 file changed, 3 insertions(+)
>=20
> diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> index b018957a1bb2..9a3c6da8db55 100644
> --- a/fs/gfs2/super.c
> +++ b/fs/gfs2/super.c
> @@ -586,7 +586,10 @@ static void gfs2_put_super(struct super_block *sb)
>  =20
>   =09if (!sb_rdonly(sb)) {
>   =09=09gfs2_make_fs_ro(sdp);
> +=09} else {
> +=09=09gfs2_quota_cleanup(sdp);
>   =09}
> +
>   =09WARN_ON(gfs2_withdrawing(sdp));
>  =20
>   =09/*  At this point, we're through modifying the disk  */
>=20

