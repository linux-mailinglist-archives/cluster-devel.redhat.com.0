Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A37609F1D
	for <lists+cluster-devel@lfdr.de>; Mon, 24 Oct 2022 12:33:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666607608;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xf4cNk0Svirq9OyE/eghoRcRWfg9o91h4Nj9liIl1Hc=;
	b=PrLhGOK5TedqzpQu/kY+iQ+ZzZqFi8RTsLmUTAl+YZm56ka4nhjYEXTKAMbXF4xwE/VrIG
	8E4Os8QA+FkgmpNu5jhLZIYB6jgWmK5wEosQPNL2JlvhsLpkJD/iybQd8TseZHlTosoV2f
	5hA3ZvLFaemSA/S4lyiv86dg8o7yqSs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-127-xcirwN3HMOmgNEKLUv3KCQ-1; Mon, 24 Oct 2022 06:33:23 -0400
X-MC-Unique: xcirwN3HMOmgNEKLUv3KCQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABC2C299E760;
	Mon, 24 Oct 2022 10:33:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A06022166B34;
	Mon, 24 Oct 2022 10:33:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 848EC1946597;
	Mon, 24 Oct 2022 10:33:22 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D2AD41946587 for <cluster-devel@listman.corp.redhat.com>;
 Sun, 23 Oct 2022 14:36:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9ECF642222; Sun, 23 Oct 2022 14:36:30 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 963427AE5
 for <cluster-devel@redhat.com>; Sun, 23 Oct 2022 14:36:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49AC11C0755E
 for <cluster-devel@redhat.com>; Sun, 23 Oct 2022 14:36:30 +0000 (UTC)
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-DQvP-qRjPDGCD-9B4K3ryQ-1; Sun, 23 Oct 2022 10:36:25 -0400
X-MC-Unique: DQvP-qRjPDGCD-9B4K3ryQ-1
Received: from fsav411.sakura.ne.jp (fsav411.sakura.ne.jp [133.242.250.110])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 29NDcerH059200;
 Sun, 23 Oct 2022 22:38:40 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav411.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav411.sakura.ne.jp);
 Sun, 23 Oct 2022 22:38:40 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav411.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 29NDcdSK059197
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 23 Oct 2022 22:38:40 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <164aaaca-6564-0687-19f1-e90ac08c66e8@I-love.SAKURA.ne.jp>
Date: Sun, 23 Oct 2022 22:38:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
To: syzbot <syzbot+da97a57c5b742d05db51@syzkaller.appspotmail.com>,
 agruenba@redhat.com, cluster-devel@redhat.com, rpeterso@redhat.com,
 syzkaller-bugs@googlegroups.com
References: <0000000000008eb80505ebaea3d3@google.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <0000000000008eb80505ebaea3d3@google.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Mon, 24 Oct 2022 10:33:21 +0000
Subject: Re: [Cluster-devel] [syzbot] general protection fault in
 gfs2_parse_param
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
Cc: Andrew Morton <akpm@linux-foundation.org>, Ian Kent <raven@themaw.net>
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Please wait for response on https://lkml.kernel.org/r/ce198a72-92c9-e09a-ca92-2860326c2938@I-love.SAKURA.ne.jp .

On 2022/10/23 16:29, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    4d48f589d294 Add linux-next specific files for 20221021
> git tree:       linux-next
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=15e511ba880000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=2c4b7d600a5739a6
> dashboard link: https://syzkaller.appspot.com/bug?extid=da97a57c5b742d05db51
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14e2fbe6880000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1146d66a880000
> 

