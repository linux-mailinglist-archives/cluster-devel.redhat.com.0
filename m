Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0383F553097
	for <lists+cluster-devel@lfdr.de>; Tue, 21 Jun 2022 13:19:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655810354;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6XB+nBjplTm9vBeHwUv2s0kqRRPok01ZDIfMV1h7pMQ=;
	b=HYpdhk1amDvU7IcJBq1bYRnmS3tryOumPF3IxKm3P4ODiatUBgwZA6N1aXIWOSzt2/OD3W
	IJGbLzfbF5Era5KsMYP7nWIIdKIIIK33utkjX1cU71NOXWi+275H5THBXVb0NitlpRvAa3
	ao7yLg4QDJOb543mmRCsM1n0Cn/OAS4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-vmpBvdMFMmeQg1zXWQxvKg-1; Tue, 21 Jun 2022 07:19:10 -0400
X-MC-Unique: vmpBvdMFMmeQg1zXWQxvKg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DBB2C101AA45;
	Tue, 21 Jun 2022 11:19:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3EEB40C141F;
	Tue, 21 Jun 2022 11:19:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5E577194704C;
	Tue, 21 Jun 2022 11:19:09 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 421FC1947041 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 21 Jun 2022 11:19:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 317FE141510D; Tue, 21 Jun 2022 11:19:08 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C450141510C
 for <cluster-devel@redhat.com>; Tue, 21 Jun 2022 11:19:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 14BED3802B8B
 for <cluster-devel@redhat.com>; Tue, 21 Jun 2022 11:19:08 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-4UtWFxE4MyiHQXfAvuOvaA-1; Tue, 21 Jun 2022 07:19:06 -0400
X-MC-Unique: 4UtWFxE4MyiHQXfAvuOvaA-1
Received: by mail-wm1-f72.google.com with SMTP id
 o2-20020a05600c510200b0039747b0216fso8330888wms.0
 for <cluster-devel@redhat.com>; Tue, 21 Jun 2022 04:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=6XB+nBjplTm9vBeHwUv2s0kqRRPok01ZDIfMV1h7pMQ=;
 b=qxoYjcJmuwYHV7o33W2JF6ZHWEMNSjbn0hjjhuEmvhw8M5gkAAxQOxfKETE6ZiaSXW
 t9DxYMZ/4mgGr8FOLZTUpsqui4S0EQL7SikUNMJ4V1Mqlz19HKq3nD0uVO0nfj+YfcIP
 nZsWq+T5x6/rTUzyyrmOZYKVK/5z6uyP6akoyCXW7u0MGfIY+8NE0zaKbDyIkr+QgmTP
 KWCxAnIFo6n27ndRUyDzTD2+tD7eIKGrh0Lx+Qf6P9TFyArFdmd6zHjXXP0SuA71UpOT
 iDeyhX8T0Tuyg+8XUZ6vgBzrdKjssVnuqMUzlV1PDs/HEODgnbTEAkg9C8Eno8SLUANm
 fLOA==
X-Gm-Message-State: AJIora/SmHFdjCdyc+T8HhvY8ZiD+PJhWf1dAcx2RciHr5B4+mmJgRas
 4A3bPoR9E632hVkM61lQXtlCdgYQkHERC2CEWvA55wHWT9Wcp1ip6pzjeC6h8jZctOCQ38x/BJl
 2wEio1j2wVh+3I5/0haa0Mw==
X-Received: by 2002:adf:e10c:0:b0:21a:1903:7ed with SMTP id
 t12-20020adfe10c000000b0021a190307edmr27827856wrz.437.1655810345545; 
 Tue, 21 Jun 2022 04:19:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tTwkV2ozWVs6dRCTDWFoOWE29FxN16Z48AGCCZTAWrYWAw9rZq6zByaNWC6w7ghwZYq599fA==
X-Received: by 2002:adf:e10c:0:b0:21a:1903:7ed with SMTP id
 t12-20020adfe10c000000b0021a190307edmr27827832wrz.437.1655810345260; 
 Tue, 21 Jun 2022 04:19:05 -0700 (PDT)
Received: from [192.168.1.165]
 (cpc76484-cwma10-2-0-cust967.7-3.cable.virginm.net. [82.31.203.200])
 by smtp.gmail.com with ESMTPSA id
 i30-20020a1c541e000000b0039c15861001sm20843929wmb.21.2022.06.21.04.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jun 2022 04:19:04 -0700 (PDT)
Message-ID: <97a9a768-1915-f532-09a4-99ee78a639ae@redhat.com>
Date: Tue, 21 Jun 2022 12:19:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
To: Christoph Hellwig <hch@lst.de>
References: <20220621091420.GC3256@lst.de>
From: Andrew Price <anprice@redhat.com>
In-Reply-To: <20220621091420.GC3256@lst.de>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Subject: Re: [Cluster-devel] Mounting lock_nolock file systems?
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
Cc: cluster-devel@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/06/2022 10:14, Christoph Hellwig wrote:
> I'm felling a little stupid, but in the past after a
> 
> mkfs.gfs2  -O -p lock_nolock
> 
> I could just mount the created file system locally.
> 
> On current mainline that does not seem to work any more, what am I
> missing?

I can't reproduce the problem on current mainline. What version of 
gfs2-utils is your mkfs.gfs2 from?

Could you send your superblock?

   dd if=/dev/vdb bs=4k skip=16 count=1 status=none | xxd -a

will grab it.

Andy

> Here is the output from the mount attempt:
> 
> oot@testvm:~# mount /dev/vdb /mnt/
> [  154.745017] gfs2: fsid=vdb: Trying to join cluster "lock_nolock", "vdb"
> [  154.745024] gfs2: fsid=vdb: Now mounting FS (format 1801)...
> [  154.782279] gfs2: fsid=vdb.0: journal 0 mapped with 1 extents in 0ms
> [  154.784878] gfs2: fsid=vdb.0: jid=0, already locked for use
> [  154.784885] gfs2: fsid=vdb.0: jid=0: Looking at journal...
> [  154.787474] gfs2: fsid=vdb.0: jid=0: Journal head lookup took 2ms
> [  154.787482] gfs2: fsid=vdb.0: jid=0: Acquiring the transaction lock...
> [  154.787513] gfs2: fsid=vdb.0: jid=0: Replaying journal...0x0 to 0x0
> [  154.787522] gfs2: fsid=vdb.0: jid=0: Replayed 0 of 0 blocks
> [  154.787525] gfs2: fsid=vdb.0: jid=0: Found 0 revoke tags
> [  154.788116] gfs2: fsid=vdb.0: jid=0: Journal replayed in 3ms [jlck:0ms, jhead:2ms, tl]
> [  154.788239] gfs2: fsid=vdb.0: jid=0: Done
> [  154.789896] gfs2: fsid=vdb.0: first mount done, others may mount
> [  154.802688] gfs2: fsid=vdb.0: fatal: filesystem consistency error - function = gfs2_m5
> [  154.802700] gfs2: fsid=vdb.0: about to withdraw this file system
> [  185.894949] gfs2: fsid=vdb.0: Journal recovery skipped for jid 0 until next mount.
> [  185.894975] gfs2: fsid=vdb.0: Glock dequeues delayed: 0
> [  185.895202] gfs2: fsid=vdb.0: File system withdrawn
> [  185.895220] CPU: 1 PID: 2777 Comm: mount Not tainted 5.19.0-rc3+ #1713
> [  185.895229] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-2 04/04
> [  185.895239] Call Trace:
> [  185.895247]  <TASK>
> [  185.895251]  dump_stack_lvl+0x45/0x5a
> [  185.895276]  gfs2_withdraw.cold+0xdb/0x507
> [  185.895305]  gfs2_fill_super+0xb5a/0xbe0
> [  185.895312]  ? gfs2_fill_super+0x771/0xbe0
> [  185.895319]  ? gfs2_fill_super+0xa22/0xbe0
> [  185.895325]  ? gfs2_reconfigure+0x3c0/0x3c0
> [  185.895330]  get_tree_bdev+0x169/0x270
> [  185.895341]  gfs2_get_tree+0x19/0x80
> [  185.895346]  vfs_get_tree+0x20/0xb0
> [  185.895352]  path_mount+0x2b1/0xa70
> [  185.895362]  __x64_sys_mount+0xfe/0x140
> [  185.895370]  do_syscall_64+0x3b/0x90
> [  185.895378]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
> [  185.895388] RIP: 0033:0x7fd8ba7269ea
> [  185.895404] Code: 48 8b 0d a9 f4 0b 00 f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 08
> [  185.895410] RSP: 002b:00007ffea6838018 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
> [  185.895419] RAX: ffffffffffffffda RBX: 00007fd8ba849264 RCX: 00007fd8ba7269ea
> [  185.895423] RDX: 000055669b2724e0 RSI: 000055669b26dc50 RDI: 000055669b26b370
> [  185.895427] RBP: 000055669b26b140 R08: 0000000000000000 R09: 00007fd8ba7e6be0
> [  185.895431] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> [  185.895434] R13: 000055669b26b370 R14: 000055669b2724e0 R15: 000055669b26b140
> [  185.895443]  </TASK>
> [  185.895461] gfs2: fsid=vdb.0: can't make FS RW: -5
> 
> 

