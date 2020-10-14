Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7416028E09E
	for <lists+cluster-devel@lfdr.de>; Wed, 14 Oct 2020 14:38:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602679125;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tqkeDSKu3ZVkwLcs3UzzlEHF4mgQLeE6ZnH74qRT2H8=;
	b=FBUUE/z0PBqdCDH3CbqfJUGfiWacSdqdGyLpjk1MBqyDwHnt+0rl/ijRCI9vROFODF8sNE
	kL0Xhtyc5pSrcaN947yJSifT9B0qzK4FV1x2/9Qd1jpDkNmUq9PRIFencu3hztFOvaiWRC
	E07DXCLKNPkJpcFDW0s5tf6WBcwC/sQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-j0ODztTPMa6VNZtOT0zkuw-1; Wed, 14 Oct 2020 08:38:43 -0400
X-MC-Unique: j0ODztTPMa6VNZtOT0zkuw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39BC664145;
	Wed, 14 Oct 2020 12:38:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCD786EF7B;
	Wed, 14 Oct 2020 12:38:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2878F18095FF;
	Wed, 14 Oct 2020 12:38:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09ECcbEC025013 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 14 Oct 2020 08:38:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 315895C1C2; Wed, 14 Oct 2020 12:38:37 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.138] (unknown [10.33.36.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E3EA5C22D;
	Wed, 14 Oct 2020 12:38:31 +0000 (UTC)
To: Anant Thazhemadam <anant.thazhemadam@gmail.com>
References: <0000000000006903b205b0873061@google.com>
	<21b7b508-c8f2-4730-7a1d-b4376effcce0@redhat.com>
	<ceed2e5f-c03e-721f-ba2f-a581d6214e5c@gmail.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <4d7412bf-15ba-58ee-3fa2-e6641dbca723@redhat.com>
Date: Wed, 14 Oct 2020 13:38:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <ceed2e5f-c03e-721f-ba2f-a581d6214e5c@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: syzbot <syzbot+af90d47a37376844e731@syzkaller.appspotmail.com>,
	syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
	cluster-devel@redhat.com
Subject: Re: [Cluster-devel] KASAN: slab-out-of-bounds Write in
 gfs2_fill_super
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14/10/2020 13:19, Anant Thazhemadam wrote:
> 
> On 30/09/20 7:52 pm, Andrew Price wrote:
>> On 30/09/2020 13:39, syzbot wrote:
>>> Hello,
>>>
>>> syzbot found the following issue on:
>>>
>>> HEAD commit:    fb0155a0 Merge tag 'nfs-for-5.9-3' of git://git.linux-nfs...
>>> git tree:       upstream
>>> console output: https://syzkaller.appspot.com/x/log.txt?x=13458c0f900000
>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=adebb40048274f92
>>> dashboard link: https://syzkaller.appspot.com/bug?extid=af90d47a37376844e731

> 
> Just saw this report.
> This seems to be the same as
>      https://syzkaller.appspot.com/bug?extid=a5e2482a693e6b1e444b ,
> for which I have recently sent in a fix (https://lkml.org/lkml/2020/10/13/588).

Thanks. The gfs2 maintainers are probably busy but I'll review the patch.

> Since the "Reported-by" tag in the patch sent is for the other instance of the
> same crash, can we close this one as a duplicate?

I expect the duplicates will get closed once a fix is in the tree so 
there's no need to spend time on that.

Andy

