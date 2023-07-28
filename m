Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B64766C0D
	for <lists+cluster-devel@lfdr.de>; Fri, 28 Jul 2023 13:49:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690544942;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=amggK1c1iFQcIsltx9iiMJ/J2TdCT43VOB9zNEC3MjI=;
	b=JtMzeZUb23pHOYfx4xdJlWtzTVfJ7GEpdMrBHiueDdHrs4TwfEJ6JzCb/EzVRAKctKIrxP
	P2MpnljQqzVBmnOgAgEEQdIfXwTlqu8rd/8saJ7gFSokvtrJwh8+wPFE2hUpYtSrfMhLe6
	YHWM284Tybg9wl+U+PCmdmrwTg2taw0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-zSsKQrdaO5-3rUQl-7Z7ug-1; Fri, 28 Jul 2023 07:48:57 -0400
X-MC-Unique: zSsKQrdaO5-3rUQl-7Z7ug-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A86786F121;
	Fri, 28 Jul 2023 11:48:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F07C040C2063;
	Fri, 28 Jul 2023 11:48:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A7CDC1946A6E;
	Fri, 28 Jul 2023 11:48:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 76C8F1946586 for <cluster-devel@listman.corp.redhat.com>;
 Fri, 28 Jul 2023 11:48:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 64C45145414B; Fri, 28 Jul 2023 11:48:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C4F1145414E
 for <cluster-devel@redhat.com>; Fri, 28 Jul 2023 11:48:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 303CA803FEF
 for <cluster-devel@redhat.com>; Fri, 28 Jul 2023 11:48:51 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-353-gI0Fd9lyNfaxsPJcCcpRCA-1; Fri, 28 Jul 2023 07:48:49 -0400
X-MC-Unique: gI0Fd9lyNfaxsPJcCcpRCA-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-403cddf284bso23038271cf.0
 for <cluster-devel@redhat.com>; Fri, 28 Jul 2023 04:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690544929; x=1691149729;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=amggK1c1iFQcIsltx9iiMJ/J2TdCT43VOB9zNEC3MjI=;
 b=CW9tCrP4aZr2xsTMVMAax1Z1t94U+tkrkse1AqnD8n7zYF9u0IxBO0S3HETee2FV1I
 WUmsDNmCfPOaFQwQCm3c0cHQ4Vny4Vg8LNR48u4c12BOL6OqH+BFizD66JJMb0QkBJFp
 RHkTALTFkoLfYght4hJYpJTRk4x0svsiy90TfWQSLq84Fi4ns+qc1Zs23ZJ238u0Mw8n
 ndMVC5Ie9bh9DFrU8kyZxHWU9GBAc93wqS9iWW0XJVXxsSFY+Z1Y7tL3D/dqwpGm34kJ
 9el8OyfKq2cilmB8bSEmdNpbrJpJoepl6HmACcRiN4DDiIJsaC7JYo6jY2sPpKM4f93J
 78Ng==
X-Gm-Message-State: ABy/qLYG4w4vGQHLJTyjts1EJeGRpQmDYwPYxK3lfOARGULpkwiFjMJT
 EIPRkpqnzec4+MXAy6eJi8rgnFAgGvjietTHEgvlmeBK7srsFAqgLRnbB3zmta9Bhe8m6hLKQQ9
 a9rRgFbSkerUzNCMS6L+s2w==
X-Received: by 2002:a05:622a:170c:b0:403:a263:5402 with SMTP id
 h12-20020a05622a170c00b00403a2635402mr2914427qtk.18.1690544929315; 
 Fri, 28 Jul 2023 04:48:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF4HP9emyj8PfcdfRAEbYECoLJjWWPCTFXihnHLKkpiXAxEqfjwIUSpFIWY/4/sObMMv7h2zQ==
X-Received: by 2002:a05:622a:170c:b0:403:a263:5402 with SMTP id
 h12-20020a05622a170c00b00403a2635402mr2914415qtk.18.1690544929078; 
 Fri, 28 Jul 2023 04:48:49 -0700 (PDT)
Received: from [172.16.0.7] ([209.73.90.46]) by smtp.gmail.com with ESMTPSA id
 c26-20020ac81e9a000000b00403fcd4ea59sm1099677qtm.10.2023.07.28.04.48.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Jul 2023 04:48:48 -0700 (PDT)
Message-ID: <c4360163-3595-e152-765d-641f9c79e8fd@redhat.com>
Date: Fri, 28 Jul 2023 06:48:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: David Howells <dhowells@redhat.com>,
 syzbot <syzbot+607aa822c60b2e75b269@syzkaller.appspotmail.com>
References: <00000000000045a44b0601802056@google.com>
 <200478.1690532408@warthog.procyon.org.uk>
From: Bob Peterson <rpeterso@redhat.com>
In-Reply-To: <200478.1690532408@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: Re: [Cluster-devel] [syzbot] [gfs2?] kernel panic: hung_task:
 blocked tasks (2)
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
Cc: arnd@arndb.de, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/23 3:20 AM, David Howells wrote:
> syzbot <syzbot+607aa822c60b2e75b269@syzkaller.appspotmail.com> wrote:
> 
>> Fixes: 9c8ad7a2ff0b ("uapi, x86: Fix the syscall numbering of the mount API syscalls [ver #2]")
> 
> This would seem unlikely to be the culprit.  It just changes the numbering on
> the fsconfig-related syscalls.
> 
> Running the test program on v6.5-rc3, however, I end up with the test process
> stuck in the D state:
> 
> INFO: task repro-17687f1aa:5551 blocked for more than 120 seconds.
>        Not tainted 6.5.0-rc3-build3+ #1448
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:repro-17687f1aa state:D stack:0     pid:5551  ppid:5516   flags:0x00004002
> Call Trace:
>   <TASK>
>   __schedule+0x4a7/0x4f1
>   schedule+0x66/0xa1
>   schedule_timeout+0x9d/0xd7
>   ? __next_timer_interrupt+0xf6/0xf6
>   gfs2_gl_hash_clear+0xa0/0xdc
>   ? sugov_irq_work+0x15/0x15
>   gfs2_put_super+0x19f/0x1d3
>   generic_shutdown_super+0x78/0x187
>   kill_block_super+0x1c/0x32
>   deactivate_locked_super+0x2f/0x61
>   cleanup_mnt+0xab/0xcc
>   task_work_run+0x6b/0x80
>   exit_to_user_mode_prepare+0x76/0xfd
>   syscall_exit_to_user_mode+0x14/0x31
>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
> RIP: 0033:0x7f89aac31dab
> RSP: 002b:00007fff43d9b878 EFLAGS: 00000206 ORIG_RAX: 00000000000000a6
> RAX: 0000000000000000 RBX: 00007fff43d9cad8 RCX: 00007f89aac31dab
> RDX: 0000000000000000 RSI: 000000000000000a RDI: 00007fff43d9b920
> RBP: 00007fff43d9c960 R08: 0000000000000000 R09: 0000000000000073
> R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
> R13: 00007fff43d9cae8 R14: 0000000000417e18 R15: 00007f89aad51000
>   </TASK>
> 
> David
> 
Hi David,

This indicates gfs2 is having trouble resolving and freeing all its 
glocks, which usually means a reference counting problem or ail (active 
items list) problem during unmount.

If gfs2_gl_hash_clear gets stuck for a long period of time it is 
supposed to dump the remaining list of glocks that still have not been 
resolved. I think it takes 10 minutes or so. Can you post the console 
messages that follow? That will help us figure out what's happening. Thanks.

Regards,

Bob Peterson

