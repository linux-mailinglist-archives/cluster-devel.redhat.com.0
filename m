Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2C46C10FF
	for <lists+cluster-devel@lfdr.de>; Mon, 20 Mar 2023 12:39:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679312382;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XG+gtyj12ijRgq3Do4tbIjmAOrHa6RToW38uEEwmt7o=;
	b=Eao2AsSFNuHpEnXdn3B31su0/RZ9DSpUAJllKN1D9ap7ms23tKuxU8ULGFtwFhx46WbOrc
	XwGULp8oicwVPkXyD7JGRsc208ngNQ0t/3TW5Dj2H9WCjDEaf/9+DXhC6NKBMKLSI4E0NZ
	u40odPUo/YFVcDx5fIK6Ya3V5JPWbRQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-hetgpk5kMs-G87cVz7WFow-1; Mon, 20 Mar 2023 07:39:38 -0400
X-MC-Unique: hetgpk5kMs-G87cVz7WFow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87E072A59575;
	Mon, 20 Mar 2023 11:39:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B46B51121315;
	Mon, 20 Mar 2023 11:39:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8477919465B3;
	Mon, 20 Mar 2023 11:39:36 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 16F5D19465A3 for <cluster-devel@listman.corp.redhat.com>;
 Wed, 15 Mar 2023 09:12:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 06B4E202701F; Wed, 15 Mar 2023 09:12:56 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F31C7202701E
 for <cluster-devel@redhat.com>; Wed, 15 Mar 2023 09:12:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D46FE3813F30
 for <cluster-devel@redhat.com>; Wed, 15 Mar 2023 09:12:55 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-346-ngeyZn1rNYiOwyxeAK9XWg-1; Wed, 15 Mar 2023 05:12:52 -0400
X-MC-Unique: ngeyZn1rNYiOwyxeAK9XWg-1
Received: by mail-wr1-f51.google.com with SMTP id m2so3831684wrh.6;
 Wed, 15 Mar 2023 02:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678871570; x=1681463570;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XG+gtyj12ijRgq3Do4tbIjmAOrHa6RToW38uEEwmt7o=;
 b=dxHsQI6hN+1z4lOv9DbsbTMU0VgXFV8BMoO0b30r6IzUNrXIYY5A4pqeLMEj4K/jMD
 3UuDR9xL3N/B/5ep299LCPWs5OsEuwx3lQN9tujEI10L6aXrjubl60iGg5UV2z10Mh/P
 moU1qXE2wA5y8Y0lAH3nYFPLA8WXnF0KgibGsNqhcwcXRBWXg8VPoPXFsdiih6RPhKfF
 8dmoDwuQz65m5NJE4Nmch1fJpP5PnPtT71Odv5LCxJjxvm3ps9AYBgzd9p4qRgEQAPHb
 UeEyOhq5I7k2Yh0p63B114Aa0k/+Jy2NJGAWR5t9iGlklH/2rAeV8y2IQnvMI1LD9ZN4
 FJxw==
X-Gm-Message-State: AO0yUKXkELQ+Ty/Ju6vRIcTZfARR40hBSn074tOjtipGh4zAtHXR5x6Q
 BkBUYQ8uFS5phPQDLsSOrrOnFbq0N5kCmA==
X-Google-Smtp-Source: AK7set+cC3t4rSWhCbloQnA5H/EeQwQk0vSes5HwlqPgBF1jJNCxA0cWVzQ2RULUWdqKmw5hfeTMiw==
X-Received: by 2002:adf:e907:0:b0:2cf:f30f:c916 with SMTP id
 f7-20020adfe907000000b002cff30fc916mr958784wrm.4.1678871569853; 
 Wed, 15 Mar 2023 02:12:49 -0700 (PDT)
Received: from [192.168.10.15] ([37.252.81.68])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a5d4d0d000000b002cfe1377fb1sm4005542wrt.70.2023.03.15.02.12.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 02:12:49 -0700 (PDT)
Message-ID: <97abb511-9918-4df5-e421-835b4ecd324c@gmail.com>
Date: Wed, 15 Mar 2023 13:12:47 +0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: rpeterso@redhat.com, agruenba@redhat.com
References: <20230315090620.7294-1-ivan.orlov0322@gmail.com>
From: Ivan Orlov <ivan.orlov0322@gmail.com>
In-Reply-To: <20230315090620.7294-1-ivan.orlov0322@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Mon, 20 Mar 2023 11:39:34 +0000
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/15/23 13:06, Ivan Orlov wrote:
> Syzkaller reported the following issue:
> 
> UBSAN: array-index-out-of-bounds in fs/gfs2/bmap.c:901:46
> index 11 is out of range for type 'u64 [11]'
> CPU: 0 PID: 5067 Comm: syz-executor164 Not tainted 6.1.0-syzkaller-13031-g77856d911a8c #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
> Call Trace:
>   <TASK>
>   __dump_stack lib/dump_stack.c:88 [inline]
>   dump_stack_lvl+0x1b1/0x290 lib/dump_stack.c:106
>   ubsan_epilogue lib/ubsan.c:151 [inline]
>   __ubsan_handle_out_of_bounds+0xe0/0x110 lib/ubsan.c:282
>   __gfs2_iomap_get+0x4a4/0x16e0 fs/gfs2/bmap.c:901
>   gfs2_iomap_get fs/gfs2/bmap.c:1399 [inline]
>   gfs2_block_map+0x28f/0x7f0 fs/gfs2/bmap.c:1214
>   gfs2_write_alloc_required+0x441/0x6e0 fs/gfs2/bmap.c:2322
>   gfs2_jdesc_check+0x1b9/0x290 fs/gfs2/super.c:114
>   init_journal+0x5a4/0x22c0 fs/gfs2/ops_fstype.c:804
>   init_inodes+0xdc/0x340 fs/gfs2/ops_fstype.c:889
>   gfs2_fill_super+0x1bb2/0x2700 fs/gfs2/ops_fstype.c:1247
>   get_tree_bdev+0x400/0x620 fs/super.c:1282
>   gfs2_get_tree+0x50/0x210 fs/gfs2/ops_fstype.c:1330
>   vfs_get_tree+0x88/0x270 fs/super.c:1489
>   do_new_mount+0x289/0xad0 fs/namespace.c:3145
>   do_mount fs/namespace.c:3488 [inline]
>   __do_sys_mount fs/namespace.c:3697 [inline]
>   __se_sys_mount+0x2d3/0x3c0 fs/namespace.c:3674
>   do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>   do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
> RIP: 0033:0x7f2c63567aca
> Code: 83 c4 08 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffd0e3a28d8 EFLAGS: 00000282 ORIG_RAX: 00000000000000a5
> RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f2c63567aca
> RDX: 0000000020037f40 RSI: 0000000020037f80 RDI: 00007ffd0e3a28e0
> RBP: 00007ffd0e3a28e0 R08: 00007ffd0e3a2920 R09: 0000000000043350
> R10: 0000000002000011 R11: 0000000000000282 R12: 0000000000000004
> R13: 00005555567192c0 R14: 00007ffd0e3a2920 R15: 0000000000000000
>   </TASK>
> 
> This issue is caused by the 'while' loop in the '__gfs2_iomap_get' function,
> which increments 'height' var until it matches the condition. If height is
> larger or equal to 'sdp->sd_heightsize' array size (which is GFS2_MAX_META_HEIGHT
> + 1), the array-index-out-of-bounds issue occurs. Therefore we need to add extra
> condition to the while loop, which will prevent this issue.
> 
> Additionally, if 'height' var after the while ending is equal to GFS2_MAX_META_HEIGHT,
> the 'find_metapath' call right after the loop will break (because it assumes that
> 'height' parameter will not be larger than the size of metapath's mp_list array length,
> which is GFS2_MAX_META_HEIGHT). So, we need to check the 'height' after the loop ending,
> and if its value is too big we need to break the execution of the function, and return
> a proper error if it is too big.
> 
> Tested via syzbot.
> 
> Reported-by: syzbot+45d4691b1ed3c48eba05@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?id=42296ea544c870f4dde3b25efa4cc1b89515d38e
> Signed-off-by: Ivan Orlov <ivan.orlov0322@gmail.com>
> ---
>   fs/gfs2/bmap.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
> index eedf6926c652..9b7358165f96 100644
> --- a/fs/gfs2/bmap.c
> +++ b/fs/gfs2/bmap.c
> @@ -895,8 +895,16 @@ static int __gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
>   	iomap->length = len << inode->i_blkbits;
>   
>   	height = ip->i_height;
> -	while ((lblock + 1) * sdp->sd_sb.sb_bsize > sdp->sd_heightsize[height])
> +
> +	while (height <= GFS2_MAX_META_HEIGHT
> +		&& (lblock + 1) * sdp->sd_sb.sb_bsize > sdp->sd_heightsize[height])
>   		height++;
> +
> +	if (height > GFS2_MAX_META_HEIGHT) {
> +		ret = -ERANGE;
> +		goto unlock;
> +	}
> +
>   	find_metapath(sdp, lblock, mp, height);
>   	if (height > ip->i_height || gfs2_is_stuffed(ip))
>   		goto do_alloc;

Upd. I made a typo in the second paragraph of patch description: the 
'find_metapath' call will break if height is larger than 
GFS2_MAX_META_HEIGHT, not equal to. So this I check in corresponding 
condition right after the while loop.

