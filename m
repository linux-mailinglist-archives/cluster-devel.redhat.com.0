Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A837859B0
	for <lists+cluster-devel@lfdr.de>; Wed, 23 Aug 2023 15:46:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692798386;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Eq0j4wOflrCZJLCdrYDb6ppBDzMOqnUcGqRqF9KXxH4=;
	b=StDanuEa2E8TFog8qAh6xotmHWu5ekjqJLKi5au37cBvVu9uSbtgjSLxjBamdGtRVuX+ct
	OBmrQI5vTB6TxVTsgqQfzU/XV4dB/9AGOxuGco4FmhxysPkAHHbE0gwdV8PyN9TKDK1A+U
	CfW0WSOE8n8rmMuo6uRM3eCE23sctFk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-FhTJ0fa5MhSA8eixX-p1QQ-1; Wed, 23 Aug 2023 09:46:24 -0400
X-MC-Unique: FhTJ0fa5MhSA8eixX-p1QQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F02291021E19;
	Wed, 23 Aug 2023 13:46:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7485140C6F4C;
	Wed, 23 Aug 2023 13:46:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 10945194658F;
	Wed, 23 Aug 2023 13:46:21 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0CFBA1946589 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 23 Aug 2023 13:43:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E083664661; Wed, 23 Aug 2023 13:43:19 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA42B63F7A
 for <cluster-devel@redhat.com>; Wed, 23 Aug 2023 13:43:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA22F3C0C481
 for <cluster-devel@redhat.com>; Wed, 23 Aug 2023 13:43:19 +0000 (UTC)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-6AoR0DLPPdWf8X0MooVnQA-1; Wed, 23 Aug 2023 09:43:18 -0400
X-MC-Unique: 6AoR0DLPPdWf8X0MooVnQA-1
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-68a3f3f1e56so4087763b3a.3
 for <cluster-devel@redhat.com>; Wed, 23 Aug 2023 06:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692798196; x=1693402996;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eq0j4wOflrCZJLCdrYDb6ppBDzMOqnUcGqRqF9KXxH4=;
 b=WaZvd+a5r7V0+e2X5PyhMdTkBwBN0Uor00UDljqaQQvixAljmyZSBbNdEKaHlK26uM
 56ZoeR2OpA4noKwVuOxaY+/mBt8/MBVUPKQ321OYINH3mc+e/C+tMkjTymlOhxXiQ2hR
 OU7lZwJdrhtPFkwkwPJRI4Rmj6TZgAhxeDL2YeYfxVCmlGKsm8W3KjArP65APqjRsOMT
 sy/5Nzp5SNGVAD6Fu+aTUKSAM/ASCNlb47NBdbYhY9cqa9NPgmWEPk1JqMlmkhNL1vKT
 I9d4QEjLc4uiVuIb69qPlMsS+jzLv20/A8YTa28my7TQ7C68HeBy3SJ4nSnA+pr8SCFZ
 k1aA==
X-Gm-Message-State: AOJu0YxFSRmCTvOpUflMg8ek/3CuO8l3KvWhYe7SJQ4r5xqkOPxNcj/x
 UR00cO80AnDIRBNDuyATAy+2ufORlVSN/fUjhvBPPg93mR9ox/8IMsVR1CiJQmpAjLvqlaIjKd/
 adsosDMEkvRw0l7oxX1NkTdqnBKZ/yuYCHkwyHxoWoicxmA==
X-Received: by 2002:a05:6a21:7881:b0:13a:52ce:13cc with SMTP id
 bf1-20020a056a21788100b0013a52ce13ccmr12599450pzc.51.1692798196367; 
 Wed, 23 Aug 2023 06:43:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbbEZb/tHcDh2oL5DUw0SEIptHT0y8VNk2A+rz1XdOpuf4lBhfFtPNpbtRHOZbn7hJE0N3sBqTqVMPP99QfPg=
X-Received: by 2002:a05:6a21:7881:b0:13a:52ce:13cc with SMTP id
 bf1-20020a056a21788100b0013a52ce13ccmr12599426pzc.51.1692798195948; Wed, 23
 Aug 2023 06:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000002b5e2405f14e860f@google.com>
 <20230127051009.3881703-1-eadavis@sina.com>
 <6561085e-d4c9-bd04-d59b-eb39cfbaa3e7@redhat.com>
In-Reply-To: <6561085e-d4c9-bd04-d59b-eb39cfbaa3e7@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 23 Aug 2023 15:43:04 +0200
Message-ID: <CAHc6FU5Zk6drhr_mC36hCMrq=ZmpDeBQsS9AZOT-NdsiXb1qVg@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix uaf for qda in gfs2_quota_sync
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
Cc: syzbot+3f6a670108ce43356017@syzkaller.appspotmail.com,
 cluster-devel@redhat.com, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, eadavis@sina.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 22, 2023 at 9:32=E2=80=AFPM Bob Peterson <rpeterso@redhat.com> =
wrote:
> On 1/26/23 11:10 PM, eadavis@sina.com wrote:
> > From: Edward Adam Davis <eadavis@sina.com>
> >
> > [   81.372851][ T5532] CPU: 1 PID: 5532 Comm: syz-executor.0 Not tainte=
d 6.2.0-rc1-syzkaller-dirty #0
> > [   81.382080][ T5532] Hardware name: Google Google Compute Engine/Goog=
le Compute Engine, BIOS Google 01/12/2023
> > [   81.392343][ T5532] Call Trace:
> > [   81.395654][ T5532]  <TASK>
> > [   81.398603][ T5532]  dump_stack_lvl+0x1b1/0x290
> > [   81.418421][ T5532]  gfs2_assert_warn_i+0x19a/0x2e0
> > [   81.423480][ T5532]  gfs2_quota_cleanup+0x4c6/0x6b0
> > [   81.428611][ T5532]  gfs2_make_fs_ro+0x517/0x610
> > [   81.457802][ T5532]  gfs2_withdraw+0x609/0x1540
> > [   81.481452][ T5532]  gfs2_inode_refresh+0xb2d/0xf60
> > [   81.506658][ T5532]  gfs2_instantiate+0x15e/0x220
> > [   81.511504][ T5532]  gfs2_glock_wait+0x1d9/0x2a0
> > [   81.516352][ T5532]  do_sync+0x485/0xc80
> > [   81.554943][ T5532]  gfs2_quota_sync+0x3da/0x8b0
> > [   81.559738][ T5532]  gfs2_sync_fs+0x49/0xb0
> > [   81.564063][ T5532]  sync_filesystem+0xe8/0x220
> > [   81.568740][ T5532]  generic_shutdown_super+0x6b/0x310
> > [   81.574112][ T5532]  kill_block_super+0x79/0xd0
> > [   81.578779][ T5532]  deactivate_locked_super+0xa7/0xf0
> > [   81.584064][ T5532]  cleanup_mnt+0x494/0x520
> > [   81.593753][ T5532]  task_work_run+0x243/0x300
> > [   81.608837][ T5532]  exit_to_user_mode_loop+0x124/0x150
> > [   81.614232][ T5532]  exit_to_user_mode_prepare+0xb2/0x140
> > [   81.619820][ T5532]  syscall_exit_to_user_mode+0x26/0x60
> > [   81.625287][ T5532]  do_syscall_64+0x49/0xb0
> > [   81.629710][ T5532]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> > [   81.636292][ T5532] RIP: 0033:0x7efdd688d517
> > [   81.640728][ T5532] Code: ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 =
0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 =
00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 4=
8
> > [   81.660550][ T5532] RSP: 002b:00007fff34520ce8 EFLAGS: 00000246 ORIG=
_RAX: 00000000000000a6
> > [   81.669413][ T5532] RAX: 0000000000000000 RBX: 0000000000000000 RCX:=
 00007efdd688d517
> > [   81.677403][ T5532] RDX: 00007fff34520db9 RSI: 000000000000000a RDI:=
 00007fff34520db0
> > [   81.685388][ T5532] RBP: 00007fff34520db0 R08: 00000000ffffffff R09:=
 00007fff34520b80
> > [   81.695973][ T5532] R10: 0000555555ca38b3 R11: 0000000000000246 R12:=
 00007efdd68e6b24
> > [   81.704152][ T5532] R13: 00007fff34521e70 R14: 0000555555ca3810 R15:=
 00007fff34521eb0
> > [   81.712868][ T5532]  </TASK>
> >
> > The function "gfs2_quota_cleanup()" may be called in the function "do_s=
ync()",
> > This will cause the qda obtained in the function "qd_check_sync" to be =
released, resulting in the occurrence of uaf.
> > In order to avoid this uaf, we can increase the judgment of "sdp->sd_qu=
ota_bitmap" released in the function
> > "gfs2_quota_cleanup" to confirm that "sdp->sd_quota_list" has been rele=
ased.
> >
> > Link: https://lore.kernel.org/all/0000000000002b5e2405f14e860f@google.c=
om
> > Reported-and-tested-by: syzbot+3f6a670108ce43356017@syzkaller.appspotma=
il.com
> > Signed-off-by: Edward Adam Davis <eadavis@sina.com>
> > ---
> >   fs/gfs2/quota.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> > index 1ed1722..4cf66bd 100644
> > --- a/fs/gfs2/quota.c
> > +++ b/fs/gfs2/quota.c
> > @@ -1321,6 +1321,9 @@ int gfs2_quota_sync(struct super_block *sb, int t=
ype)
> >                                       qda[x]->qd_sync_gen =3D
> >                                               sdp->sd_quota_sync_gen;
> >
> > +                     if (!sdp->sd_quota_bitmap)
> > +                             break;
> > +
> >                       for (x =3D 0; x < num_qd; x++)
> >                               qd_unlock(qda[x]);
> >               }
>
> Hi Edward,
>
> Can you try to recreate this problem on a newer version of the gfs2 code?

The problem is that gfs2_quota_sync() is holding references to
gfs2_quota_data objects when the filesystem decides to withdraw. The
withdraw code calls gfs2_quota_cleanup(), which wipes away the
gfs2_quota_data objects that gfs2_quota_sync() is still referencing.
So that reference counting needs to be fixed. Alternatively, if we
could delay the withdraw until the end of gfs2_quota_sync(), we would
be fine as well, but we don't have that kind of mechanism.

> In the linux-gfs2 repository I've got a branch called "bobquota" that
> has a bunch of patches related to quota syncing. I don't know if these
> will fix your problem, but it's worth trying.

That branch doesn't change the reference counting. It doesn't address this =
bug.

> The thing is, the qda array should have been populated by previous
> calls, like qd_fish and such, and should be okay to release by
> quota_cleanup.
>
> I can tell you this:
>
> In the call trace above, function do_sync tried to lock an inode glock,
> which tried to instantiate it, and that caused a withdraw.
> The thing is, the only inode glock used by do_sync is for the system
> quota inode. If it had a problem instantiating that, your file system is
> corrupt and needs to be run through fsck.gfs2. It could indicate a
> hardware problem reading the system quota dinode from the storage media.
>
> If possible I'd like to know how you cause this problem to occur. What
> were you doing to get this to happen? And how can I recreate it?

It's one of those syzbot bugs, so filesystem fuzzing.

> GFS2 might have a problem with withdrawing during this sequence, but I
> don't think it has much to do with the sd_quota_bitmap.

Yes, I agree.

> Regards,
>
> Bob Peterson
> GFS2 File System

Thanks,
Andreas

