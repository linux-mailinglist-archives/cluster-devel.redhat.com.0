Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C566F0C42
	for <lists+cluster-devel@lfdr.de>; Thu, 27 Apr 2023 21:04:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682622292;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aIMe4HgR4j+uLyNFZnx6VTdZb99E5zuis1nlCbyNQZ8=;
	b=CO08d0MdoHuGpqTowCWNY17zFg4YjVcTsXDuMP3I6g6z8ZbuMJqEsuS9AmHqfNDccGHuA4
	jRPydJOIcmaKD/nnqlDIWmU05uy2N1ngeGnTxFSztB3Nnkv4LwO9zxtdz+KjuAnDTcrlJI
	IJeh7bY0opp5Ono/NfhpTROK/vtZpV0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-Z3A1EhaJOi2XW7xz3skkdw-1; Thu, 27 Apr 2023 15:04:46 -0400
X-MC-Unique: Z3A1EhaJOi2XW7xz3skkdw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57348800B35;
	Thu, 27 Apr 2023 19:04:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCE1A63F46;
	Thu, 27 Apr 2023 19:04:40 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 588EF1946A50;
	Thu, 27 Apr 2023 19:04:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 81FE81946A45 for <cluster-devel@listman.corp.redhat.com>;
 Thu, 27 Apr 2023 19:04:24 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 42B9540AE2C1; Thu, 27 Apr 2023 19:04:24 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AB2D40C2064
 for <cluster-devel@redhat.com>; Thu, 27 Apr 2023 19:04:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18D6C80D0E5
 for <cluster-devel@redhat.com>; Thu, 27 Apr 2023 19:04:24 +0000 (UTC)
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-w7uDuUz_MvaWvRjcbjJVZw-1; Thu, 27 Apr 2023 15:04:22 -0400
X-MC-Unique: w7uDuUz_MvaWvRjcbjJVZw-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-5ee8e5e93d7so52631456d6.1
 for <cluster-devel@redhat.com>; Thu, 27 Apr 2023 12:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682622261; x=1685214261;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aIMe4HgR4j+uLyNFZnx6VTdZb99E5zuis1nlCbyNQZ8=;
 b=Sl3pYEL87bJvUnRcLMnxSlVIn9HeFzkXHJBWwzL6OBOASk+8NHUJoxJOOtNspYmU3c
 ZfL2iQCg+CNIfspolJ32Wpy99RIFtA2C4AgJqaRvxH9LayqX4M/Zy4iwmscUMOBmM1XD
 b+vFzViQHfufhROcXIrv9KvowpBQirRcLUg6tzHnFs3R0xmY6F0UWX00/A6f6HHWQs0k
 g/85PILPtGW6i3lfbkgqHVwrX1USEUzk50KYxfkyYLWvxYD+MCLNqqXDWzfawVD9KZvr
 Pb55lKmYdkwUakb0rSqnoLa35mTP8I8hr2iGuqmX91NB6HHAwqCEdA2pMx6fXQz3dofg
 t9yg==
X-Gm-Message-State: AC+VfDzD++IMdSFbPB4MQks55wy2vehX5PovjugLGc+ozBVAYOv0vPJu
 cI2QXxCHWDMJSL+cL8wNqQmsmDKBLrEBOwbzeKdJgVycWTRReIiVckcgX9Txp6Y12OpUuiG15V6
 pdgFr/tzGK6i+skHHkAmGhw==
X-Received: by 2002:ad4:4ee9:0:b0:5f1:5cf1:b4c8 with SMTP id
 dv9-20020ad44ee9000000b005f15cf1b4c8mr3813289qvb.35.1682622261418; 
 Thu, 27 Apr 2023 12:04:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4SB3ZpF6dpDmJ9SOMuCZdR4eEW/J9n7aNhD3J51znEIy6E5R4o2TS1XiwTUz6GHVehnHeGPA==
X-Received: by 2002:ad4:4ee9:0:b0:5f1:5cf1:b4c8 with SMTP id
 dv9-20020ad44ee9000000b005f15cf1b4c8mr3813243qvb.35.1682622260984; 
 Thu, 27 Apr 2023 12:04:20 -0700 (PDT)
Received: from ?IPV6:2601:883:c200:210:6ae9:ce2:24c9:b87b?
 ([2601:883:c200:210:6ae9:ce2:24c9:b87b])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a0cf4c8000000b005ef5fc3a136sm5808498qvm.110.2023.04.27.12.04.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 12:04:20 -0700 (PDT)
Message-ID: <224ae998-d264-c984-263d-a9a7cf6c7a00@redhat.com>
Date: Thu, 27 Apr 2023 15:04:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
To: yang lan <lanyang0908@gmail.com>, agruenba@redhat.com,
 cluster-devel@redhat.com, linux-kernel@vger.kernel.org
References: <CAAehj2ntp=h1ob2MVWv7_3NuT=wtA6Gpdk9ZWWYU=pDy8PvmBw@mail.gmail.com>
From: Bob Peterson <rpeterso@redhat.com>
In-Reply-To: <CAAehj2ntp=h1ob2MVWv7_3NuT=wtA6Gpdk9ZWWYU=pDy8PvmBw@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Cluster-devel] We found a general protection fault in evict
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
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/27/23 11:15 AM, yang lan wrote:
> Hi,
> 
> We use our modified Syzkaller to fuzz the latest Linux kernel and find a 
> bug in the gfs2 file system.
> 
> We have used the utility syz-execprog to reproduce this bug with 
> ./syz-execprog -executor=./syz-executor -repeat=100 -procs=6 -cover=1 poc.
> Now, this bug can be triggered with the following prog provided:
> 
> HEAD commit: f1b32fda06d2 tag: v5.10.179
> console log: https://pastebin.com/raw/3XhteWrX 
> <https://pastebin.com/raw/3XhteWrX>
> kernel config: https://pastebin.com/raw/BiggLxRg 
> <https://pastebin.com/raw/BiggLxRg>
> Syz reproducer: https://pastebin.com/raw/PwbMR8ag 
> <https://pastebin.com/raw/PwbMR8ag>
> C reproducer: 
> https://drive.google.com/file/d/1j4g8EUrFb1GGdaaRBNHE4ATXiqeg6-zI/view?usp=sharing <https://drive.google.com/file/d/1j4g8EUrFb1GGdaaRBNHE4ATXiqeg6-zI/view?usp=sharing>
> 
> gfs2: fsid=syz:syz.0: no resource groups found in the file system.

Hi,

The upstream kernel doesn't seem to GPF here. I get a non-fatal file 
system withdraw (which seems reasonable given what the resulting fs 
looks like):

[root@bob-upstream9 /home/bob/xfstests-dev]# /home/bob/tools/c/poc_evict
[root@bob-upstream9 /home/bob/xfstests-dev]# echo $?
0

[ 2530.707005] gfs2: fsid=syz:syz: Trying to join cluster "lock_nolock", 
"syz:syz"
[ 2530.707576] gfs2: fsid=syz:syz: Now mounting FS (format 1801)...
[ 2530.708349] gfs2: fsid=syz:syz.0: fatal: filesystem consistency error
[ 2530.708349]   inode = 3 2076
[ 2530.708349]   function = gfs2_dinode_in, file = fs/gfs2/glops.c, line 
= 472
[ 2530.709534] gfs2: fsid=syz:syz.0: G:  s:SH n:2/81c f:qobnN t:SH 
d:EX/0 a:0 v:0 r:3 m:200 p:1
[ 2530.710165] gfs2: fsid=syz:syz.0:  H: s:SH f:H e:0 p:1825 [mount] 
gfs2_fill_super+0x8f0/0xef0 [gfs2]
[ 2530.710846] gfs2: fsid=syz:syz.0:  I: n:3/2076 t:4 f:0x00 
d:0x00000000 s:0 p:0
[ 2530.711387] gfs2: fsid=syz:syz.0: about to withdraw this file system
[ 2530.711857] gfs2: fsid=syz:syz.0: File system withdrawn
[ 2530.712256] CPU: 6 PID: 1825 Comm: mount Kdump: loaded Not tainted 
6.3.0-rc3+ #26
[ 2530.712803] Hardware name: Red Hat KVM/RHEL-AV, BIOS 1.16.1-1.el9 
04/01/2014
[ 2530.713324] Call Trace:
[ 2530.713513]  <TASK>
[ 2530.713678]  dump_stack_lvl+0x48/0x60
[ 2530.713959]  gfs2_withdraw+0x479/0x5c0 [gfs2]
[ 2530.714299]  gfs2_inode_refresh+0x267/0x2d0 [gfs2]
[ 2530.714667]  gfs2_instantiate+0x87/0xc0 [gfs2]
[ 2530.715013]  gfs2_glock_wait+0x8b/0xb0 [gfs2]
[ 2530.715356]  init_journal+0x302/0xaf0 [gfs2]
[ 2530.715693]  ? vsnprintf+0x2ba/0x560
[ 2530.715966]  ? gfs2_fill_super+0x8f0/0xef0 [gfs2]
[ 2530.716326]  ? snprintf+0x3d/0x50
[ 2530.716576]  gfs2_fill_super+0x8f0/0xef0 [gfs2]
[ 2530.716927]  ? gfs2_fill_super+0x7aa/0xef0 [gfs2]
[ 2530.717287]  ? mutex_lock+0x12/0x40
[ 2530.717552]  ? __pfx_gfs2_fill_super+0x10/0x10 [gfs2]
[ 2530.717938]  ? snprintf+0x3d/0x50
[ 2530.718190]  ? sget_fc+0x208/0x300
[ 2530.718453]  ? __pfx_gfs2_fill_super+0x10/0x10 [gfs2]
[ 2530.718837]  get_tree_bdev+0x171/0x270
[ 2530.719126]  gfs2_get_tree+0x22/0x90 [gfs2]
[ 2530.719446]  vfs_get_tree+0x26/0xd0
[ 2530.719711]  path_mount+0x464/0xa80
[ 2530.719981]  __x64_sys_mount+0xeb/0x120
[ 2530.720271]  do_syscall_64+0x5d/0x90
[ 2530.720544]  ? syscall_exit_to_user_mode+0x1b/0x40
[ 2530.720902]  ? do_syscall_64+0x6d/0x90
[ 2530.721185]  ? do_syscall_64+0x6d/0x90
[ 2530.721467]  ? syscall_exit_to_user_mode+0x1b/0x40
[ 2530.721823]  ? do_syscall_64+0x6d/0x90
[ 2530.722106]  ? do_syscall_64+0x6d/0x90
[ 2530.722386]  ? do_syscall_64+0x6d/0x90
[ 2530.722668]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
[ 2530.723046] RIP: 0033:0x7f7dcd83f7be
[ 2530.723316] Code: 48 8b 0d 65 a6 1b 00 f7 d8 64 89 01 48 83 c8 ff c3 
66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 49 89 ca b8 a5 00 00 00 0f 
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 32 a6 1b 00 f7 d8 64 89 01 48
[ 2530.724659] RSP: 002b:00007fffe0f3d248 EFLAGS: 00000246 ORIG_RAX: 
00000000000000a5
[ 2530.725211] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 
00007f7dcd83f7be
[ 2530.725733] RDX: 000055b230c02e20 RSI: 000055b230c02e60 RDI: 
000055b230c02e40
[ 2530.726256] RBP: 000055b230c02bf0 R08: 0000000000000000 R09: 
00007fffe0f3bf70
[ 2530.726776] R10: 0000000000000000 R11: 0000000000000246 R12: 
0000000000000000
[ 2530.727298] R13: 000055b230c02e20 R14: 000055b230c02e40 R15: 
000055b230c02bf0
[ 2530.727819]  </TASK>
[ 2530.728005] gfs2: fsid=syz:syz.0: can't read journal index: -5

I'm guessing it's a problem we've already fixed in newer versions, but I 
don't have easy access to that kernel. Perhaps you can bisect it?
I could try older kernels but I've already spent a lot of time on this 
today, so I need to move on to other things.

Regards,

Bob Peterson

