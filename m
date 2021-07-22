Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D819C3D234C
	for <lists+cluster-devel@lfdr.de>; Thu, 22 Jul 2021 14:24:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1626956660;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PNUMBIoKiTHP4boPOQZVF1stCUzaAWoNvFJ+6lFEdSY=;
	b=hRP+x3pAa0MV4LWcHcR8hUxqfBU+QWvZmfA4l7zZNedd2YPpyLGzKo9E0+jcxKAsXt38or
	QBVJ0tObHJW63+NKIJyVvIDv4280fFfMEcU6OchUWVUs5Mp02UCqzB4v1GLDybuHWAbWEW
	0f4tkABRWLlFLpCA+y6rAdCEpZsClqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-215-C4Q4hu-SM9-8yUtIoSou6w-1; Thu, 22 Jul 2021 08:24:19 -0400
X-MC-Unique: C4Q4hu-SM9-8yUtIoSou6w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C0E4107B7E5;
	Thu, 22 Jul 2021 12:24:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3BEF5D9C6;
	Thu, 22 Jul 2021 12:24:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D5864BB7C;
	Thu, 22 Jul 2021 12:24:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16MCO7Jx001422 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 22 Jul 2021 08:24:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B11D4105018B; Thu, 22 Jul 2021 12:24:07 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC37F1054594
	for <cluster-devel@redhat.com>; Thu, 22 Jul 2021 12:24:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 395E81078462
	for <cluster-devel@redhat.com>; Thu, 22 Jul 2021 12:24:04 +0000 (UTC)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
	[209.85.166.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-530-mBCww2BfNaCC5zB4iU0OKw-1; Thu, 22 Jul 2021 08:24:03 -0400
X-MC-Unique: mBCww2BfNaCC5zB4iU0OKw-1
Received: by mail-io1-f71.google.com with SMTP id
	x21-20020a5d99150000b02904e00bb129f0so3871970iol.18
	for <cluster-devel@redhat.com>; Thu, 22 Jul 2021 05:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=PNUMBIoKiTHP4boPOQZVF1stCUzaAWoNvFJ+6lFEdSY=;
	b=d9+gBq/A16UWBovVNx9WQGujaD7hrFNC92H7yx5bf82qq9cMxp2RiBCuHFm6J6cRfN
	knKMCl39f+4Bosyx+SAEfKsOfMzGs7mTjzSWTX9Bb6n+WhrfACqhD9oWrBmUd1VPNZrF
	5p7njnK50Zc3LsQRJvaMxFGqO5lM1vv64wq12kVDCwuRgI48ZqD2NeNMC9WlB6PkvaIG
	Ey/NpwtGw3R0pkDGayj4nTUjaJ03mg31Lh0NL0GSxM8+YZ++9JXV7C3tWrivfxU11uns
	+yNzwEYWLSx5Oc59TXOp97vPXhEWWUcfV1+fbA+C6OvQo6N0kSNRFQ5tN9eY04aB217K
	FaqA==
X-Gm-Message-State: AOAM533bI38BqDjZ5QotSPG5XP0t7xCXtrANwY84M7ClnOXjhNNu7pEx
	njrR3nrixVE7jDo/fyuJEYDizUXi2kGeqKOWpdEqteE11sTztzwfa98pcEPcd3ORryvTQFM4qd0
	5Q8jXYXwgMLP6Yov/QQoa0pSXeJ+qwfs2VcUfUnrtaGCNh/WIyFcwuxZgjYsmcDq+3KFMASaIJw
	==
X-Received: by 2002:a5e:d918:: with SMTP id n24mr7463893iop.173.1626956642261; 
	Thu, 22 Jul 2021 05:24:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVBSy8WCEdHA3cqvPmllOZN4/0DCHIGKfFVrYEtJSBF5pcKElQxtnVJNiyCCpLyKCpo0yjKw==
X-Received: by 2002:a5e:d918:: with SMTP id n24mr7463877iop.173.1626956642062; 
	Thu, 22 Jul 2021 05:24:02 -0700 (PDT)
Received: from [172.16.0.19] (209-212-39-192.brainerd.net. [209.212.39.192])
	by smtp.gmail.com with ESMTPSA id
	m1sm16298446iok.33.2021.07.22.05.24.01
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 22 Jul 2021 05:24:01 -0700 (PDT)
To: Andrew Morton <akpm@linux-foundation.org>,
	syzbot <syzbot+0d5b462a6f07447991b3@syzkaller.appspotmail.com>
References: <000000000000b25bb805c798a1a5@google.com>
	<20210721145801.8ca097bc1d9ad3d0018517bd@linux-foundation.org>
From: Bob Peterson <rpeterso@redhat.com>
Message-ID: <79cd82dd-2aab-6a9a-8981-17c0b7787f5f@redhat.com>
Date: Thu, 22 Jul 2021 07:24:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721145801.8ca097bc1d9ad3d0018517bd@linux-foundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-mm@kvack.org,
	syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [syzbot] WARNING in __set_page_dirty
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 7/21/21 4:58 PM, Andrew Morton wrote:
> (cc gfs2 maintainers)
>
> On Tue, 20 Jul 2021 19:07:25 -0700 syzbot <syzbot+0d5b462a6f07447991b3@syzkaller.appspotmail.com> wrote:
>
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    d936eb238744 Revert "Makefile: Enable -Wimplicit-fallthrou..
>> git tree:       upstream
>> console output: https://syzkaller.appspot.com/x/log.txt?x=1512834a300000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=f1b998c1afc13578
>> dashboard link: https://syzkaller.appspot.com/bug?extid=0d5b462a6f07447991b3
>> userspace arch: i386
>>
>> Unfortunately, I don't have any reproducer for this issue yet.
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+0d5b462a6f07447991b3@syzkaller.appspotmail.com
>>
>> ------------[ cut here ]------------
>> WARNING: CPU: 0 PID: 8696 at include/linux/backing-dev.h:283 inode_to_wb include/linux/backing-dev.h:283 [inline]
>> WARNING: CPU: 0 PID: 8696 at include/linux/backing-dev.h:283 account_page_dirtied mm/page-writeback.c:2435 [inline]
>> WARNING: CPU: 0 PID: 8696 at include/linux/backing-dev.h:283 __set_page_dirty+0xace/0x1070 mm/page-writeback.c:2483
>> Modules linked in:
>> CPU: 0 PID: 8696 Comm: syz-executor.0 Not tainted 5.14.0-rc1-syzkaller #0
>> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.14.0-2 04/01/2014
>> RIP: 0010:inode_to_wb include/linux/backing-dev.h:283 [inline]
>> RIP: 0010:account_page_dirtied mm/page-writeback.c:2435 [inline]
>> RIP: 0010:__set_page_dirty+0xace/0x1070 mm/page-writeback.c:2483
>> Code: a8 01 00 00 be ff ff ff ff 48 8d 78 70 e8 0a bf 8c 07 31 ff 89 c3 89 c6 e8 3f af d8 ff 85 db 0f 85 ac f7 ff ff e8 f2 a7 d8 ff <0f> 0b e9 a0 f7 ff ff e8 e6 a7 d8 ff 4c 8d 75 08 48 b8 00 00 00 00
>> RSP: 0000:ffffc90000e578a0 EFLAGS: 00010093
>> RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
>> RDX: ffff888013d71c40 RSI: ffffffff819cdfce RDI: 0000000000000003
>> RBP: ffffea0001de0240 R08: 0000000000000000 R09: ffff888019819e07
>> R10: ffffffff819cdfc1 R11: 0000000000000000 R12: 0000000000000293
>> R13: ffff888078a38c90 R14: ffff888019819e00 R15: ffff888019819c58
>> FS:  0000000000000000(0000) GS:ffff88802ca00000(0063) knlGS:0000000009b20380
>> CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
>> CR2: 00007fd805161390 CR3: 000000004c16a000 CR4: 0000000000150ef0
>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>> Call Trace:
>>   mark_buffer_dirty+0x49a/0x5e0 fs/buffer.c:1108
>>   gfs2_unpin+0x123/0xd10 fs/gfs2/lops.c:111
>>   buf_lo_after_commit+0x140/0x210 fs/gfs2/lops.c:750
>>   lops_after_commit fs/gfs2/lops.h:49 [inline]
>>   gfs2_log_flush+0x162b/0x2940 fs/gfs2/log.c:1108
>>   do_sync+0x5ab/0xcd0 fs/gfs2/quota.c:967
>>   gfs2_quota_sync+0x2e2/0x660 fs/gfs2/quota.c:1310
>>   gfs2_sync_fs+0x40/0xb0 fs/gfs2/super.c:711
>>   __sync_filesystem fs/sync.c:39 [inline]
> Seems that gfs2_unpin() is running mark_buffer_dirty() against a bh
> which is attached to a non-upto-date page.
>
Hmm. That mark_buffer_dirty has been there since 2007, so this will 
require some analysis.
A reproducer would be helpful, since we've never seen this before.

Bob Peterson


