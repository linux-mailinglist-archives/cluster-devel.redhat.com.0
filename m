Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C93D6416D1
	for <lists+cluster-devel@lfdr.de>; Sat,  3 Dec 2022 14:15:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670073340;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ejRSA43yHtM6obUl3XfK9PwvSifxzLsh/Q+7LIIYmCQ=;
	b=dbwrzLQK+2dAu19pJl119zp1tGgBQc3EC0+y892eWwJSMp9ZQJLr6kyvnPW5W8AW7btISH
	Wh4KJirnqJ55Uj6HxWt/BlmC66LT0csDJFqxwZUPJ4aHd8suTmGvhDIIWZqsgUFYt1yD2o
	1Y29vlsc2yPuYpLbld0EbeUg52liHqU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-o7jb5ci6NECouWUwJyoyyA-1; Sat, 03 Dec 2022 08:15:35 -0500
X-MC-Unique: o7jb5ci6NECouWUwJyoyyA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34CE829ABA03;
	Sat,  3 Dec 2022 13:15:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 33B224060E3;
	Sat,  3 Dec 2022 13:15:30 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6869219465A8;
	Sat,  3 Dec 2022 13:15:27 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 010B11946587 for <cluster-devel@listman.corp.redhat.com>;
 Sat,  3 Dec 2022 13:15:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E503540E9785; Sat,  3 Dec 2022 13:15:26 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCCE940C6EC3
 for <cluster-devel@redhat.com>; Sat,  3 Dec 2022 13:15:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0B6F29AB413
 for <cluster-devel@redhat.com>; Sat,  3 Dec 2022 13:15:26 +0000 (UTC)
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-231-1HolMpUUOFC151zGdLNf3g-1; Sat, 03 Dec 2022 08:15:23 -0500
X-MC-Unique: 1HolMpUUOFC151zGdLNf3g-1
Received: by mail-yw1-f199.google.com with SMTP id
 00721157ae682-3dfb9d11141so49374997b3.3
 for <cluster-devel@redhat.com>; Sat, 03 Dec 2022 05:15:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ejRSA43yHtM6obUl3XfK9PwvSifxzLsh/Q+7LIIYmCQ=;
 b=sIjaT+cWAQ9UOVZ1kOWsNdBHHJzKUBBpck8kydwz/3zQM6cZQcqTlMRJAtf9J1M9bO
 /TGXqYaoudMFk9rWnsptOxLq8NnDmNIU8sUG6TqaXe4eEJZN9HYdImZ7R2h3opGRAyk7
 sUeEb7sVG7JMItmV4qrYLwfxyEFov3jFHHqNz38EZZ1fZ8HBlhKgq26hlB0l90soAYSA
 BP1bIellTHDMddb2Nx63t2//tuPWIGvUZUNLqzpvrKHZED2vK95dNz3W3nEmr6n78n20
 0AI6uiPWa4CRPrnYBBvDPfTxWTd+0+LnpKE1aQ7fhnHLIird2DWf04j249+JyWDL6tD6
 87Gg==
X-Gm-Message-State: ANoB5pn1lnjHOxALk1PrRNFaycaykEZ137kp48JSfESXv2VG1X0Z1zyo
 VVzrEPqJie7M0Z5f5tK0wToBoh4bVrRyaQbzsYQG1hPJssPBNtxpRuvNtVtKim/XLWnk7grVb/+
 mLyPXPsiLRK2NKUCFPsjYMmpTvQhyyYSZdG5ENw==
X-Received: by 2002:a25:909:0:b0:6f6:e111:a9ec with SMTP id
 9-20020a250909000000b006f6e111a9ecmr27357253ybj.259.1670073322753; 
 Sat, 03 Dec 2022 05:15:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4ajHgIZDaCXOge8e9krhBKprqlUR9wmx70qp3xZ28pAsSqfKR8Lh99KtQX2bl6pR6JF6/opJTmoyEdMZRvKzM=
X-Received: by 2002:a25:909:0:b0:6f6:e111:a9ec with SMTP id
 9-20020a250909000000b006f6e111a9ecmr27357232ybj.259.1670073322320; Sat, 03
 Dec 2022 05:15:22 -0800 (PST)
MIME-Version: 1.0
References: <20221201115032.3540859-1-bobo.shaobowang@huawei.com>
 <5c66dbe3-5701-ba42-7933-73a31c2dc891@huawei.com>
In-Reply-To: <5c66dbe3-5701-ba42-7933-73a31c2dc891@huawei.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sat, 3 Dec 2022 14:15:11 +0100
Message-ID: <CAHc6FU7b3geKS7sjt5ehiaenALemWtaGTdWJvNt2JftRFuLG_Q@mail.gmail.com>
To: "Wangshaobo (bobo)" <bobo.shaobowang@huawei.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
Cc: cluster-devel@redhat.com, syzkaller-bugs@googlegroups.com,
 liwei391@huawei.com, linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

thank you for this bug report.

On Sat, Dec 3, 2022 at 8:28 AM Wangshaobo (bobo)
<bobo.shaobowang@huawei.com> wrote:
> =E5=9C=A8 2022/12/1 19:50, Wang ShaoBo =E5=86=99=E9=81=93:
> > syzbot has reported an interesting issue:
> >
> > INFO: task syz-executor888:3126 blocked for more than 143 seconds.
> >        Not tainted 6.1.0-rc6-syzkaller-32662-g6d464646530f #0
> > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this messag=
e.
> > task:syz-executor888 state:D stack:0     pid:3126  ppid:3124   flags:0x=
00000000
> > Call trace:
> >   __switch_to+0x180/0x298 arch/arm64/kernel/process.c:553
> >   context_switch kernel/sched/core.c:5209 [inline]
> >   __schedule+0x408/0x594 kernel/sched/core.c:6521
> >   schedule+0x64/0xa4 kernel/sched/core.c:6597
> >   schedule_timeout+0x108/0x1b4 kernel/time/timer.c:1935
> >   gfs2_gl_hash_clear+0xd4/0x1b0 fs/gfs2/glock.c:2263
> >   gfs2_put_super+0x318/0x390 fs/gfs2/super.c:620
> >   generic_shutdown_super+0x94/0x198 fs/super.c:492
> >   kill_block_super+0x30/0x78 fs/super.c:1428
> >   gfs2_kill_sb+0x68/0x78
> >   deactivate_locked_super+0x70/0xe8 fs/super.c:332
> >   deactivate_super+0xd0/0xd4 fs/super.c:363
> >   cleanup_mnt+0x184/0x1c0 fs/namespace.c:1186
> >   __cleanup_mnt+0x20/0x30 fs/namespace.c:1193
> >   task_work_run+0x100/0x148 kernel/task_work.c:179
> >   resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
> >   do_notify_resume+0x174/0x1f0 arch/arm64/kernel/signal.c:1127
> >   prepare_exit_to_user_mode arch/arm64/kernel/entry-common.c:137 [inlin=
e]
> >   exit_to_user_mode arch/arm64/kernel/entry-common.c:142 [inline]
> >   el0_svc+0x9c/0x150 arch/arm64/kernel/entry-common.c:638
> >   el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:655
> >   el0t_64_sync+0x190/0x194 arch/arm64/kernel/entry.S:584
> >
> > Showing all locks held in the system:
> > 1 lock held by rcu_tasks_kthre/11:
> >   #0: ffff80000d4a4768 (rcu_tasks.tasks_gp_mutex){+.+.}-{3:3}, at: rcu_=
tasks_one_gp+0x3c/0x450 kernel/rcu/tasks.h:507
> > 1 lock held by rcu_tasks_trace/12:
> >   #0: ffff80000d4a4db8 (rcu_tasks_trace.tasks_gp_mutex){+.+.}-{3:3}, at=
: rcu_tasks_one_gp+0x3c/0x450 kernel/rcu/tasks.h:507
> > 1 lock held by khungtaskd/27:
> >   #0: ffff80000d4a4640 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquir=
e+0x4/0x48 include/linux/rcupdate.h:303
> > 2 locks held by getty/2759:
> >   #0: ffff0000c7d7e098 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref=
_wait+0x28/0x58 drivers/tty/tty_ldisc.c:244
> >   #1: ffff80000f6be2f0 (&ldata->atomic_read_lock){+.+.}-{3:3}, at: n_tt=
y_read+0x19c/0x89c drivers/tty/n_tty.c:2177
> > 1 lock held by syz-executor888/3126:
> >   #0: ffff0000cae680e0 (&type->s_umount_key#41){+.+.}-{3:3}, at: deacti=
vate_super+0xc8/0xd4 fs/super.c:362
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > One task blocked after executing gfs2_gl_hash_clear(), it looks
> > like go to sleep for waiting the condition (&sdp->sd_glock_disposal =3D=
=3D 0),
> > this field sd_glock_disposal is used to count the getting times
> > that calling gfs2_glock_get() success, In most cases, when we operate
> > the mount interface, we will finally call this function:
> >
> >                                do_mount()
> >                                path_mount()
> >                                vfs_get_tree()
> >                                gfs2_get_tree()
> >                                get_tree_bdev()
> >                                gfs2_fill_super()
> >                       ________ init_inodes()_____________
> >                      V                                   V
> >         gfs2_lookup_simple()                         gfs2_rindex_update=
()
> >         gfs2_lookupi()                               gfs2_ri_update()
> >         gfs2_dir_search()                         -> read_rindex_entry(=
) //*gfs2_rgrpd->rd_gl
> >      -> gfs2_inode_lookup() //*gfs2_inode->i_gl  |__ gfs2_glock_get()
> >     |__gfs2_glock_get()
> >
> > Correspondingly, release this glock's reference and decrease
> > sdp->sd_glock_disposal through this path when umount:
> >
> >                                cleanup_mnt()
> >                                deactivate_super()
> >                                deactivate_locked_super()
> >                                gfs2_kill_sb()
> >                                kill_block_super()
> >                                generic_shutdown_super()
> >            _gfs2_rgrpd->rd_gl__gfs2_put_super()__gfs2_inode->i_gl__
> >           V                                                        V
> >       gfs2_clear_rgrpd()                           gfs2_put_super()
> >       gfs2_glock_put()                             iput()
> >          gfs2_glock_free()                            evict()
> >                                                       gfs2_evict_inode(=
)
> >                                                       gfs2_glock_put_ev=
entually()
> >                                                       gfs2_glock_put()
> >                                                       gfs2_glock_free()
> >
> > But if calling reconfigure_super() from sysfs between mount and umount,

How are you doing that?

> > this path will also take the glock lock and increase sdp->sd_glock_disp=
osal
> > as it also call gfs2_glock_get():
> >
> >     reconfigure_super()
> >      gfs2_reconfigure()
> >        gfs2_make_fs_rw() //remount filesystem read-write
> >         gfs2_quota_init()
> >       -> qd_alloc()      //*gfs2_quota_data->qd_gl
> >      |___ gfs2_glock_get()
> >
> > This relies on gfs2_quota_cleanup() that is eventually called by
> > gfs2_make_fs_ro() to clean up but unfortunately the file system
> > has not been remounted at this time, the condition (!sb_rdonly(sb))
> > is false and gfs2_make_fs_ro() can not be called, ultimately makes
> > sdp->sd_glock_disposal never be 0.
> >
> > This add calling gfs2_quota_cleanup() when this filesystem remains
> > readOnly, in this case we don't need sync quota or other operation
> > otherwise the filesystem was really remounted.
> >
> > But this modification will trigger this warning:
> >
> >     WARNING: CPU: 7 PID: 2595 at include/linux/backing-dev.h:246 __foli=
o_mark_dirty+0x559/0x7b0
> I paste wrong, the warning is:
> gfs2: fsid=3Dmounts.0: warning: assertion "!qd->qd_change" failed at
> function =3D gfs2_quota_cleanup, file =3D fs/gfs2/quota.c, line =3D 1474

Thanks, this is making more sense now.

> qd->qd_change has been changed in gfs2_quota_init(), but it looks
> we don't need to do anything before remounting the file system as
> read-write.
> >
> > We can filter this warning with adding a parameter as it doesn't
> > really make sense here.
> >
> > Fixes: 9e6e0a128bca ("GFS2: Merge mount.c and ops_super.c into super.c"=
)
> > Reported-by: syzbot+ed7d0f71a89e28557a77@syzkaller.appspotmail.com
> > Signed-off-by: Wang ShaoBo <bobo.shaobowang@huawei.com>
> > ---
> >   fs/gfs2/super.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/fs/gfs2/super.c b/fs/gfs2/super.c
> > index b018957a1bb2..9a3c6da8db55 100644
> > --- a/fs/gfs2/super.c
> > +++ b/fs/gfs2/super.c
> > @@ -586,7 +586,10 @@ static void gfs2_put_super(struct super_block *sb)
> >
> >       if (!sb_rdonly(sb)) {
> >               gfs2_make_fs_ro(sdp);
> > +     } else {
> > +             gfs2_quota_cleanup(sdp);
> >       }
> > +
> >       WARN_ON(gfs2_withdrawing(sdp));
> >
> >       /*  At this point, we're through modifying the disk  */
> >
>

Andreas

