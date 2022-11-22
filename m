Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A203633505
	for <lists+cluster-devel@lfdr.de>; Tue, 22 Nov 2022 07:04:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669097042;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=8yvCcE7pXKBz2AooLEwz0rPsa/zDLlt45zH6Xpmx42A=;
	b=d5REVrJaBkMbX5af2oeJOoeRwpx04ZMr0z8Y3WOKb5yJeoPQ2fcLO0ZZC/BDNDstuEMc/u
	vGRM0Sey5wqbH0wXAzrpn3MQe8HNnvAiNeQ9fimN22OAPzpnkUudJvMoiLJGbrKsK1Zpby
	sllUfvvTz36aSH5qSeJDuvrOx0owmrs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-182-GfATda4AMKiavM8s5yKa1Q-1; Tue, 22 Nov 2022 01:03:58 -0500
X-MC-Unique: GfATda4AMKiavM8s5yKa1Q-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B51B8801585;
	Tue, 22 Nov 2022 06:03:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 19879477F5C;
	Tue, 22 Nov 2022 06:03:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CDFF1194658F;
	Tue, 22 Nov 2022 06:03:55 +0000 (UTC)
X-Original-To: cluster-devel@listman.corp.redhat.com
Delivered-To: cluster-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D3F811946588 for <cluster-devel@listman.corp.redhat.com>;
 Tue, 22 Nov 2022 06:03:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C48134A9254; Tue, 22 Nov 2022 06:03:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BCD734A9257
 for <cluster-devel@redhat.com>; Tue, 22 Nov 2022 06:03:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9EBB9380664C
 for <cluster-devel@redhat.com>; Tue, 22 Nov 2022 06:03:53 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-401--slpOa2pP0iHJvRqsHAHyA-1; Tue,
 22 Nov 2022 01:03:49 -0500
X-MC-Unique: -slpOa2pP0iHJvRqsHAHyA-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1oxMNt-0060Ay-Lt; Tue, 22 Nov 2022 06:03:53 +0000
Date: Tue, 22 Nov 2022 06:03:53 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Dmitry Vyukov <dvyukov@google.com>
Message-ID: <Y3xmSbsjoMRnRIEd@casper.infradead.org>
References: <CAO4mrfd4=HRXMrcdZQUorNaFss3AFfrRxuXWMFT3uh+Dvfwb9g@mail.gmail.com>
 <CAO4mrfdU4oGktM8PPFg66=32N0JSGx=gtG80S89-b66tS3NLVw@mail.gmail.com>
 <CAO4mrfftfwBWbt-a1H3q559jtnv93MQ92kp=DFnA+-pRrSObcw@mail.gmail.com>
 <CACT4Y+Zub=+V3Yx=wSagYYeybwhbBt66COyTc=OjFAMOibybxg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACT4Y+Zub=+V3Yx=wSagYYeybwhbBt66COyTc=OjFAMOibybxg@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Cluster-devel] BUG: unable to handle kernel NULL pointer
 dereference in gfs2_evict_inode
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
 linux-kernel@vger.kernel.org, Wei Chen <harperchen1110@gmail.com>,
 linux-fsdevel@vger.kernel.org, syzkaller@googlegroups.com,
 viro@zeniv.linux.org.uk
Errors-To: cluster-devel-bounces@redhat.com
Sender: "Cluster-devel" <cluster-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 18, 2022 at 10:33:21AM +0100, Dmitry Vyukov wrote:
> On Fri, 18 Nov 2022 at 09:06, Wei Chen <harperchen1110@gmail.com> wrote:
> >
> > Dear Linux developers,
> >
> > The bug persists in upstream Linux v6.0-rc5.
> 
> If you fix this, please also add the syzbot tag:
> 
> Reported-by: syzbot+8a5fc6416c175cecea34@syzkaller.appspotmail.com
> https://lore.kernel.org/all/000000000000ab092305e268a016@google.com/

Hey Dmitri, does Wei Chen work with you?  They're not responding to
requests to understand what they're doing.  eg:

https://lore.kernel.org/all/YtVhVKPAfzGmHu95@casper.infradead.org/

https://lore.kernel.org/all/Y0SAT5grkUmUW045@casper.infradead.org/

I'm just ignoring their reports now.

