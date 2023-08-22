Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8900C784A7D
	for <lists+cluster-devel@lfdr.de>; Tue, 22 Aug 2023 21:33:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692732781;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1uXbQBFWn0+yNQRo9uY5h/0fZshJw2zKNmSR5OnB5cI=;
	b=PH/oKUbtbQSV6XcCI7IvjY3rO0e1rk1nFCvv0pK4OeUz0sUyZ6hyxUKhU3Xz26y3lt5MUm
	rRlmSl1QoMx/oiwPdcwk4DvrKg3yWTmkwcaFnuXUx+XA/M/xGVVRArbdXJSXWHbu8Gehv+
	6RRGcRUinaNs9oMqHVRM5WcisJ+lnNs=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-6aBYrnbGNpiYnZoCwPm8Eg-1; Tue, 22 Aug 2023 15:32:58 -0400
X-MC-Unique: 6aBYrnbGNpiYnZoCwPm8Eg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 183BD3814947;
	Tue, 22 Aug 2023 19:32:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AC673492C14;
	Tue, 22 Aug 2023 19:32:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 535851946589;
	Tue, 22 Aug 2023 19:32:40 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 205A01946586 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 22 Aug 2023 19:32:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CA7A340C2079; Tue, 22 Aug 2023 19:32:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C391640C206F
 for <cluster-devel@redhat.com>; Tue, 22 Aug 2023 19:32:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4DCE85CCE1
 for <cluster-devel@redhat.com>; Tue, 22 Aug 2023 19:32:33 +0000 (UTC)
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-zaCkzO1wP9qAknZN4psSAw-1; Tue, 22 Aug 2023 15:32:32 -0400
X-MC-Unique: zaCkzO1wP9qAknZN4psSAw-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1c8c1f5717aso5991658fac.3
 for <cluster-devel@redhat.com>; Tue, 22 Aug 2023 12:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692732751; x=1693337551;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1uXbQBFWn0+yNQRo9uY5h/0fZshJw2zKNmSR5OnB5cI=;
 b=d/LpcYLof5/bBv8ns6cgNJfMBbAMG06heyQbOkkUbj0EweBR2h4I3rGEVeh5bTF+d3
 qnzOAxVmMFfzvrI7jb/uyiLzEKqUndjKbCUCN2u2iw8zI2g0VyWtMT7sxIod3rdcSutE
 O9rUK+4PItSaOT/BooxVELpHbO6bJky9iQ7LqNhPMKWStT+Pa4HPxxkXvTVrt00k/i+t
 md2yEvdf6QGd+lT5s7LiM+nsYBuOPTks+Bx8InuoAq2Rgrw8YBOvO8WygZGN5R5sJOSf
 z+rtI9ckMZAo3fZ78J6YJeSxI1vhy39u5jqIVE47NAluoDTU5lbVfXOw+N9UUC2ao/2v
 U9oQ==
X-Gm-Message-State: AOJu0YwVzzgAgNfsgDsywYGaG6JgFb55cnXA4wm38hkc7+BPaq94E8ZP
 6/iW07Psad3E8VFLCozawwfIAnFrO9CmL6k92TD10W7bFosq66PVG45U/qpLObUWlxPpPOd58fC
 qRrJ1JhPFznJngLD09aqe/glyRuSLq0zG
X-Received: by 2002:a05:6870:4193:b0:19f:9495:95ff with SMTP id
 y19-20020a056870419300b0019f949595ffmr14157157oac.27.1692732750843; 
 Tue, 22 Aug 2023 12:32:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeSlW1rPAw2Zt65ehZtrIGONAbXPVmXuvBOiEumdPTs0dfLLn01hP1JXxps9+qIQ2/aXgggA==
X-Received: by 2002:a05:6870:4193:b0:19f:9495:95ff with SMTP id
 y19-20020a056870419300b0019f949595ffmr14157147oac.27.1692732750585; 
 Tue, 22 Aug 2023 12:32:30 -0700 (PDT)
Received: from [172.16.0.7] ([209.73.90.46]) by smtp.gmail.com with ESMTPSA id
 n2-20020a0ce482000000b0064dd4b5fdb4sm2743077qvl.6.2023.08.22.12.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 12:32:30 -0700 (PDT)
Message-ID: <6561085e-d4c9-bd04-d59b-eb39cfbaa3e7@redhat.com>
Date: Tue, 22 Aug 2023 14:32:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: eadavis@sina.com, syzbot+3f6a670108ce43356017@syzkaller.appspotmail.com
References: <0000000000002b5e2405f14e860f@google.com>
 <20230127051009.3881703-1-eadavis@sina.com>
From: Bob Peterson <rpeterso@redhat.com>
In-Reply-To: <20230127051009.3881703-1-eadavis@sina.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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
Cc: cluster-devel@redhat.com, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/26/23 11:10 PM, eadavis@sina.com wrote:
> From: Edward Adam Davis <eadavis@sina.com>
> 
> [   81.372851][ T5532] CPU: 1 PID: 5532 Comm: syz-executor.0 Not tainted 6.2.0-rc1-syzkaller-dirty #0
> [   81.382080][ T5532] Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/12/2023
> [   81.392343][ T5532] Call Trace:
> [   81.395654][ T5532]  <TASK>
> [   81.398603][ T5532]  dump_stack_lvl+0x1b1/0x290
> [   81.418421][ T5532]  gfs2_assert_warn_i+0x19a/0x2e0
> [   81.423480][ T5532]  gfs2_quota_cleanup+0x4c6/0x6b0
> [   81.428611][ T5532]  gfs2_make_fs_ro+0x517/0x610
> [   81.457802][ T5532]  gfs2_withdraw+0x609/0x1540
> [   81.481452][ T5532]  gfs2_inode_refresh+0xb2d/0xf60
> [   81.506658][ T5532]  gfs2_instantiate+0x15e/0x220
> [   81.511504][ T5532]  gfs2_glock_wait+0x1d9/0x2a0
> [   81.516352][ T5532]  do_sync+0x485/0xc80
> [   81.554943][ T5532]  gfs2_quota_sync+0x3da/0x8b0
> [   81.559738][ T5532]  gfs2_sync_fs+0x49/0xb0
> [   81.564063][ T5532]  sync_filesystem+0xe8/0x220
> [   81.568740][ T5532]  generic_shutdown_super+0x6b/0x310
> [   81.574112][ T5532]  kill_block_super+0x79/0xd0
> [   81.578779][ T5532]  deactivate_locked_super+0xa7/0xf0
> [   81.584064][ T5532]  cleanup_mnt+0x494/0x520
> [   81.593753][ T5532]  task_work_run+0x243/0x300
> [   81.608837][ T5532]  exit_to_user_mode_loop+0x124/0x150
> [   81.614232][ T5532]  exit_to_user_mode_prepare+0xb2/0x140
> [   81.619820][ T5532]  syscall_exit_to_user_mode+0x26/0x60
> [   81.625287][ T5532]  do_syscall_64+0x49/0xb0
> [   81.629710][ T5532]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> [   81.636292][ T5532] RIP: 0033:0x7efdd688d517
> [   81.640728][ T5532] Code: ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> [   81.660550][ T5532] RSP: 002b:00007fff34520ce8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
> [   81.669413][ T5532] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007efdd688d517
> [   81.677403][ T5532] RDX: 00007fff34520db9 RSI: 000000000000000a RDI: 00007fff34520db0
> [   81.685388][ T5532] RBP: 00007fff34520db0 R08: 00000000ffffffff R09: 00007fff34520b80
> [   81.695973][ T5532] R10: 0000555555ca38b3 R11: 0000000000000246 R12: 00007efdd68e6b24
> [   81.704152][ T5532] R13: 00007fff34521e70 R14: 0000555555ca3810 R15: 00007fff34521eb0
> [   81.712868][ T5532]  </TASK>
> 
> The function "gfs2_quota_cleanup()" may be called in the function "do_sync()",
> This will cause the qda obtained in the function "qd_check_sync" to be released, resulting in the occurrence of uaf.
> In order to avoid this uaf, we can increase the judgment of "sdp->sd_quota_bitmap" released in the function
> "gfs2_quota_cleanup" to confirm that "sdp->sd_quota_list" has been released.
> 
> Link: https://lore.kernel.org/all/0000000000002b5e2405f14e860f@google.com
> Reported-and-tested-by: syzbot+3f6a670108ce43356017@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@sina.com>
> ---
>   fs/gfs2/quota.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> index 1ed1722..4cf66bd 100644
> --- a/fs/gfs2/quota.c
> +++ b/fs/gfs2/quota.c
> @@ -1321,6 +1321,9 @@ int gfs2_quota_sync(struct super_block *sb, int type)
>   					qda[x]->qd_sync_gen =
>   						sdp->sd_quota_sync_gen;
>   
> +			if (!sdp->sd_quota_bitmap)
> +				break;
> +
>   			for (x = 0; x < num_qd; x++)
>   				qd_unlock(qda[x]);
>   		}

Hi Edward,

Can you try to recreate this problem on a newer version of the gfs2 code?

In the linux-gfs2 repository I've got a branch called "bobquota" that 
has a bunch of patches related to quota syncing. I don't know if these 
will fix your problem, but it's worth trying.

The thing is, the qda array should have been populated by previous 
calls, like qd_fish and such, and should be okay to release by 
quota_cleanup.

I can tell you this:

In the call trace above, function do_sync tried to lock an inode glock, 
which tried to instantiate it, and that caused a withdraw.
The thing is, the only inode glock used by do_sync is for the system 
quota inode. If it had a problem instantiating that, your file system is 
corrupt and needs to be run through fsck.gfs2. It could indicate a 
hardware problem reading the system quota dinode from the storage media.

If possible I'd like to know how you cause this problem to occur. What 
were you doing to get this to happen? And how can I recreate it?

GFS2 might have a problem with withdrawing during this sequence, but I 
don't think it has much to do with the sd_quota_bitmap.

Regards,

Bob Peterson
GFS2 File System

