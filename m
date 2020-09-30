Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 189DF27EACD
	for <lists+cluster-devel@lfdr.de>; Wed, 30 Sep 2020 16:20:45 +0200 (CEST)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1601475645;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QYjbBMQ83eaNacfVtQ9f2FcgQ6pnWOwYQXbTX02y2e4=;
	b=VER+k0bR2u1PcSHyQrPOhHrIjwzQ5ZWgn6UVUmzwTeC9or4yk4C1siPrkR0en3NUDq6ePs
	LDwrOH48H2L3QOPkwoBKlbuxfF5jFzi16lMUsNMl8rpTmTYzmGjoJ28ZcLR7vZgI2ecV+J
	GBv1bd7IXJhTsM9qxkwqOQAgEhUyW60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-2Z8r_dylMcaPwAftuYArfg-1; Wed, 30 Sep 2020 10:20:43 -0400
X-MC-Unique: 2Z8r_dylMcaPwAftuYArfg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD1B01014DFB;
	Wed, 30 Sep 2020 14:20:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F33B268D7E;
	Wed, 30 Sep 2020 14:20:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D29D183D022;
	Wed, 30 Sep 2020 14:20:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08UEIshY019046 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 30 Sep 2020 10:18:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D9B4F1002C16; Wed, 30 Sep 2020 14:18:54 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from [10.33.36.138] (unknown [10.33.36.138])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB0B81002D42;
	Wed, 30 Sep 2020 14:18:49 +0000 (UTC)
To: syzbot <syzbot+50a8a9cf8127f2c6f5df@syzkaller.appspotmail.com>,
	agruenba@redhat.com, cluster-devel@redhat.com,
	linux-kernel@vger.kernel.org, rpeterso@redhat.com,
	syzkaller-bugs@googlegroups.com
References: <000000000000a7770405b06d21ac@google.com>
From: Andrew Price <anprice@redhat.com>
Message-ID: <e00203bd-5ee9-d265-5c2d-9b2bca0c72ca@redhat.com>
Date: Wed, 30 Sep 2020 15:18:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <000000000000a7770405b06d21ac@google.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] general protection fault in gfs2_withdraw
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 29/09/2020 06:34, syzbot wrote:
> syzbot has bisected this issue to:
> 
> commit 601ef0d52e9617588fcff3df26953592f2eb44ac
> Author: Bob Peterson <rpeterso@redhat.com>
> Date:   Tue Jan 28 19:23:45 2020 +0000
> 
>      gfs2: Force withdraw to replay journals and wait for it to finish
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=151d25e3900000
> start commit:   7c7ec322 Merge tag 'for-linus' of git://git.kernel.org/pub..
> git tree:       upstream
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=171d25e3900000
> console output: https://syzkaller.appspot.com/x/log.txt?x=131d25e3900000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6184b75aa6d48d66
> dashboard link: https://syzkaller.appspot.com/bug?extid=50a8a9cf8127f2c6f5df
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13c6a109900000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15d45ed3900000
> 
> Reported-by: syzbot+50a8a9cf8127f2c6f5df@syzkaller.appspotmail.com
> Fixes: 601ef0d52e96 ("gfs2: Force withdraw to replay journals and wait for it to finish")
> 
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 

Bug filed for this one:

https://bugzilla.redhat.com/show_bug.cgi?id=1883932

Andy

