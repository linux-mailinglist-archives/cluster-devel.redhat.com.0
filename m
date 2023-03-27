Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 606106CB221
	for <lists+cluster-devel@lfdr.de>; Tue, 28 Mar 2023 01:11:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679958672;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ixSHD7NwErKjXICuazNbf6jL54e0WVDQJqNTVBgzOPw=;
	b=Mg5lsDDyD4FvoCU34YlbWILZSTQqXL1z6n38DJ3gNv8SrYfpZ2kUOP0ov19Im79pip4rAa
	OB9fD9bKNWcw0Qnx0hNCsxMTTf4BkSxGRKGTTBorte5Q6yuvW186HGbNOf1sfuoqlO3WPY
	8H3LJ+fuJTbqMo9kv7WwzHePfscM9T4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-cU9FTlurN1mg9h6RVXPhkA-1; Mon, 27 Mar 2023 19:11:09 -0400
X-MC-Unique: cU9FTlurN1mg9h6RVXPhkA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 80ACF382C96E;
	Mon, 27 Mar 2023 23:11:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 33ED4492B0A;
	Mon, 27 Mar 2023 23:11:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0E86F19465B2;
	Mon, 27 Mar 2023 23:10:58 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A9B56194658F for <cluster-devel@listman.corp.redhat.com>;
 Mon, 27 Mar 2023 23:10:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 863A2492B03; Mon, 27 Mar 2023 23:10:47 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F28B492C3E
 for <cluster-devel@redhat.com>; Mon, 27 Mar 2023 23:10:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 656C53C0E451
 for <cluster-devel@redhat.com>; Mon, 27 Mar 2023 23:10:47 +0000 (UTC)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-y_3ZzCn6NTiYyL3c9wIwMw-1; Mon, 27 Mar 2023 19:10:46 -0400
X-MC-Unique: y_3ZzCn6NTiYyL3c9wIwMw-1
Received: by mail-pf1-f199.google.com with SMTP id
 a6-20020aa795a6000000b006262c174d64so4894813pfk.7
 for <cluster-devel@redhat.com>; Mon, 27 Mar 2023 16:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679958644;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ixSHD7NwErKjXICuazNbf6jL54e0WVDQJqNTVBgzOPw=;
 b=jvFkoGyTPm3t1nyvQsDc2U8o1EeqfDwR82uSRafwUPlijGUlylCaXkzl9nirDM5gss
 hTBcjXEb7rYq58b7iAzzPIm7uoQ+WVM3uOp/qAuHNUdWO+SJFXyjv+ISAha26HKgO35B
 NuiX+rv8Xxh4I+qvvUdlV4kok1G16dDQN2Wil2aVYWgqf7jznqtGXkZUvDtwiPdKCPT6
 kEzO0X2Hrqr4DEVhRG2AohKX/HSM6Q4Zon3JeA5KL5e0gaUFbH5ms3l6RxfI4XAgwAod
 3yf8OttwCW8KBLiOt91DsLLJbhzdYJvUgb67qGplaUj+QPKIkfjVGrKF/GXKBHGpORu6
 db2w==
X-Gm-Message-State: AAQBX9dVNxKWd56ppaF/YEOy/jR8T6Llnv9+qWGDF7tsCyp/0kzKQT5v
 eiI8DghNGHyB4CK0mgoHihNyluSTp9n5LdQ3V4/dDZ2rRulzG/OlxiN8rDzXKK3vLnYNlfgj8lo
 +mwH3kNTyxeVWO4jo7EgRWMSW+mHs39jbNWLTuA==
X-Received: by 2002:a05:6a00:2443:b0:627:9d8a:a29c with SMTP id
 d3-20020a056a00244300b006279d8aa29cmr6454296pfj.2.1679958643717; 
 Mon, 27 Mar 2023 16:10:43 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZsZfkbsZqCEpg8AZVEAG7RO+bYQgko0N4B2fTN/mKndVZPWgOB5Qh5G34qucsX7S4vjX3BrZS93kbnPoyL0lc=
X-Received: by 2002:a05:6a00:2443:b0:627:9d8a:a29c with SMTP id
 d3-20020a056a00244300b006279d8aa29cmr6454287pfj.2.1679958643398; Mon, 27 Mar
 2023 16:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230315090620.7294-1-ivan.orlov0322@gmail.com>
In-Reply-To: <20230315090620.7294-1-ivan.orlov0322@gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 28 Mar 2023 01:10:31 +0200
Message-ID: <CAHc6FU7b-BaBXrMR3UqbZGF3a_y=20TKkCNde1GvqbmN2-h1xw@mail.gmail.com>
To: Ivan Orlov <ivan.orlov0322@gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Cluster-devel] [PATCH] gfs2 FS: Fix UBSAN
 array-index-out-of-bounds in __gfs2_iomap_get
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
Cc: linux-kernel@vger.kernel.org,
 syzbot+45d4691b1ed3c48eba05@syzkaller.appspotmail.com,
 cluster-devel@redhat.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, himadrispandya@gmail.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Ivan,

On Wed, Mar 15, 2023 at 10:06=E2=80=AFAM Ivan Orlov <ivan.orlov0322@gmail.c=
om> wrote:
> Syzkaller reported the following issue:
>
> UBSAN: array-index-out-of-bounds in fs/gfs2/bmap.c:901:46
> index 11 is out of range for type 'u64 [11]'
> CPU: 0 PID: 5067 Comm: syz-executor164 Not tainted 6.1.0-syzkaller-13031-=
g77856d911a8c #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 10/26/2022
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0x1b1/0x290 lib/dump_stack.c:106
>  ubsan_epilogue lib/ubsan.c:151 [inline]
>  __ubsan_handle_out_of_bounds+0xe0/0x110 lib/ubsan.c:282
>  __gfs2_iomap_get+0x4a4/0x16e0 fs/gfs2/bmap.c:901
>  gfs2_iomap_get fs/gfs2/bmap.c:1399 [inline]
>  gfs2_block_map+0x28f/0x7f0 fs/gfs2/bmap.c:1214
>  gfs2_write_alloc_required+0x441/0x6e0 fs/gfs2/bmap.c:2322
>  gfs2_jdesc_check+0x1b9/0x290 fs/gfs2/super.c:114
>  init_journal+0x5a4/0x22c0 fs/gfs2/ops_fstype.c:804
>  init_inodes+0xdc/0x340 fs/gfs2/ops_fstype.c:889
>  gfs2_fill_super+0x1bb2/0x2700 fs/gfs2/ops_fstype.c:1247
>  get_tree_bdev+0x400/0x620 fs/super.c:1282
>  gfs2_get_tree+0x50/0x210 fs/gfs2/ops_fstype.c:1330
>  vfs_get_tree+0x88/0x270 fs/super.c:1489
>  do_new_mount+0x289/0xad0 fs/namespace.c:3145
>  do_mount fs/namespace.c:3488 [inline]
>  __do_sys_mount fs/namespace.c:3697 [inline]
>  __se_sys_mount+0x2d3/0x3c0 fs/namespace.c:3674
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> RIP: 0033:0x7f2c63567aca
> Code: 83 c4 08 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 c3 66 2e 0f 1f 84 0=
0 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffd0e3a28d8 EFLAGS: 00000282 ORIG_RAX: 00000000000000a5
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f2c63567aca
> RDX: 0000000020037f40 RSI: 0000000020037f80 RDI: 00007ffd0e3a28e0
> RBP: 00007ffd0e3a28e0 R08: 00007ffd0e3a2920 R09: 0000000000043350
> R10: 0000000002000011 R11: 0000000000000282 R12: 0000000000000004
> R13: 00005555567192c0 R14: 00007ffd0e3a2920 R15: 0000000000000000
>  </TASK>
>
> This issue is caused by the 'while' loop in the '__gfs2_iomap_get' functi=
on,
> which increments 'height' var until it matches the condition. If height i=
s
> larger or equal to 'sdp->sd_heightsize' array size (which is GFS2_MAX_MET=
A_HEIGHT
> + 1), the array-index-out-of-bounds issue occurs. Therefore we need to ad=
d extra
> condition to the while loop, which will prevent this issue.
>
> Additionally, if 'height' var after the while ending is equal to GFS2_MAX=
_META_HEIGHT,
> the 'find_metapath' call right after the loop will break (because it assu=
mes that
> 'height' parameter will not be larger than the size of metapath's mp_list=
 array length,
> which is GFS2_MAX_META_HEIGHT). So, we need to check the 'height' after t=
he loop ending,
> and if its value is too big we need to break the execution of the functio=
n, and return
> a proper error if it is too big.

Thanks for the patch, but the actual problem here is that we're
starting out with an invalid height; when starting with a valid
height, the loop will always terminate. Here's a proper fix:

https://listman.redhat.com/archives/cluster-devel/2023-March/023644.html

While looking into this, I had difficulties getting prepro.c to work.
The reason is that it always uses /dev/loop0 instead of creating its
own loop device. Here's a partial fix for that (but note that this
doesn't include the necessary cleanup code at the end):

--- a/repro.c
+++ b/repro.c
@@ -26,8 +26,6 @@
 #define __NR_memfd_create 319
 #endif

-static unsigned long long procid;
-
 //% This code is derived from puff.{c,h}, found in the zlib development. T=
he
 //% original files come with the following copyright notice:

@@ -423,8 +421,15 @@ static long syz_mount_image(volatile long fsarg,
volatile long dir,
   char* source =3D NULL;
   char loopname[64];
   if (need_loop_device) {
+    int loopctlfd;
+    long devnr;
+
+    loopctlfd =3D open("/dev/loop-control", O_RDWR);
+    devnr =3D ioctl(loopctlfd, LOOP_CTL_GET_FREE);
+    close(loopctlfd);
+
     memset(loopname, 0, sizeof(loopname));
-    snprintf(loopname, sizeof(loopname), "/dev/loop%llu", procid);
+    snprintf(loopname, sizeof(loopname), "/dev/loop%lu", devnr);
     if (setup_loop_device(data, size, loopname, &loopfd) =3D=3D -1)
       return -1;
     source =3D loopname;

Thanks,
Andreas

> Tested via syzbot.
>
> Reported-by: syzbot+45d4691b1ed3c48eba05@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?id=3D42296ea544c870f4dde3b25efa4c=
c1b89515d38e
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> ---
>  fs/gfs2/bmap.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
> index eedf6926c652..9b7358165f96 100644
> --- a/fs/gfs2/bmap.c
> +++ b/fs/gfs2/bmap.c
> @@ -895,8 +895,16 @@ static int __gfs2_iomap_get(struct inode *inode, lof=
f_t pos, loff_t length,
>         iomap->length =3D len << inode->i_blkbits;
>
>         height =3D ip->i_height;
> -       while ((lblock + 1) * sdp->sd_sb.sb_bsize > sdp->sd_heightsize[he=
ight])
> +
> +       while (height <=3D GFS2_MAX_META_HEIGHT
> +               && (lblock + 1) * sdp->sd_sb.sb_bsize > sdp->sd_heightsiz=
e[height])
>                 height++;
> +
> +       if (height > GFS2_MAX_META_HEIGHT) {
> +               ret =3D -ERANGE;
> +               goto unlock;
> +       }
> +
>         find_metapath(sdp, lblock, mp, height);
>         if (height > ip->i_height || gfs2_is_stuffed(ip))
>                 goto do_alloc;
> --
> 2.34.1
>

