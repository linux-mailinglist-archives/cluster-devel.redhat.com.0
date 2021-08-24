Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id EC7393F6A73
	for <lists+cluster-devel@lfdr.de>; Tue, 24 Aug 2021 22:31:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629837112;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=adPphQgUyPiKKj8pxXMbNRvZkdSwIV0QhUyabrpZyH8=;
	b=JiBfqeKp9yHVAZS08E9i/xVGyaip8WXlMueBFxZEUBTBN/uUfjQvnBiht+tcIGefpaxMM/
	cdsGDLX0xyjAJP6GmneILH2uX2gteUhSkO4vBpvcEYkErAjHB4cp4E9dRD6J1bUFeHV2Wg
	WTYRXmzS80MTIdMt+rJgalgFcs+T2W4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-SMpS46mDNPq8hEd0AyZrgA-1; Tue, 24 Aug 2021 16:31:50 -0400
X-MC-Unique: SMpS46mDNPq8hEd0AyZrgA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63D771008064;
	Tue, 24 Aug 2021 20:31:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 07D2A18649;
	Tue, 24 Aug 2021 20:31:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E494C181A0F8;
	Tue, 24 Aug 2021 20:31:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17OKVeCj003649 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 24 Aug 2021 16:31:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5EFF52044734; Tue, 24 Aug 2021 20:31:40 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AA252044732
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 20:31:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4022801E6D
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 20:31:37 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
	[209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-391-FUCq1zPNMxKdw4YoNZDM0A-1; Tue, 24 Aug 2021 16:31:34 -0400
X-MC-Unique: FUCq1zPNMxKdw4YoNZDM0A-1
Received: by mail-qk1-f199.google.com with SMTP id
	x19-20020a05620a099300b003f64d79cbbaso9501365qkx.7
	for <cluster-devel@redhat.com>; Tue, 24 Aug 2021 13:31:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=adPphQgUyPiKKj8pxXMbNRvZkdSwIV0QhUyabrpZyH8=;
	b=C/0CR+AZ8CnBV2pxufAxxOFAUXLnN7jAyue5+f9PEMv72h4l2W9qOktJ3XDA8WL+9h
	STSaUJaIdkgi18lHJ7E6Uu9CVlcPxdMMiSwy671+k6Maul6sUoCAqE9FG9x6ei+PvAc/
	mgexDPzm3efVd0F4amYL4uldL2rjEEYraLSi2AkjQUzPjwffaKfKa7KEhqPfMoGLV2Wk
	avQALuWIyNHXSdkV3mesPfQSbk2YKXLbwN+9dCwcC6rmVLrV+qeWY/lUCQcPY2sUe4ny
	8dBDip4MQC5JL4ErXOXqJMx67wv0YI0iSTqUox7vJqQhUUzUqFjVGJL+pa/09AyIKrUS
	bPMg==
X-Gm-Message-State: AOAM532RCv9cJgbKBrBZ2WS6pAHuXnWPLFY9tKSe6uFfwrJVNLJxG37/
	Qujhx0KAhtyx7srxhT862n2MX7lLBU7/RQvBdAnWLJvPbrNjbWg8/hRNdoRp/byyT1MK68F3yaY
	nn445SgxF5DAj4m4KLPdSqV17qtHmBTRvV4nD/g==
X-Received: by 2002:a37:9fcd:: with SMTP id
	i196mr27615398qke.247.1629837085195; 
	Tue, 24 Aug 2021 13:31:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4BbCTkhMbJQXbuN1hdtf8dH3gRlbUZSWP46Z9BA6dbgWfb97VFCsa8YXexctbOsbIDeeoyZWfOHAkg8KObEc=
X-Received: by 2002:a37:9fcd:: with SMTP id
	i196mr27615388qke.247.1629837085021; 
	Tue, 24 Aug 2021 13:31:25 -0700 (PDT)
MIME-Version: 1.0
References: <AM6PR04MB64883088DB106BD3BC49B216CFC49@AM6PR04MB6488.eurprd04.prod.outlook.com>
	<CAK-6q+jtpogQirTu86nR=pBrAZtaP6b5ouY275GuvXYq0K-1YA@mail.gmail.com>
	<69e3b252-7929-9f4b-7ff4-eef47374e0c1@suse.com>
	<CAK-6q+iqY8iitFW7yewESyQ_0QUYHZP_RsnMwmev+456d758dA@mail.gmail.com>
In-Reply-To: <CAK-6q+iqY8iitFW7yewESyQ_0QUYHZP_RsnMwmev+456d758dA@mail.gmail.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Tue, 24 Aug 2021 16:31:14 -0400
Message-ID: <CAK-6q+i8oKdHC_+Vikn95-RTtKQyfnJHYcHSuP=zfUt558PHjw@mail.gmail.com>
To: Gang He <ghe@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: "cluster-devel@redhat.com" <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] FS/DLM module triggered kernel BUG
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Gang He,

On Tue, Aug 24, 2021 at 10:18 AM Alexander Aring <aahringo@redhat.com> wrote:
...
> > >
> > >> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: generation 4 slots 2 1:172204786 2:172204748
> > >> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_directory
> > >> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_directory 8 in 1 new
> > >> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_directory 1 out 1 messages
> > >> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_masters
> > >> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_masters 33587 of 33599
> > >> [Fri Aug 20 16:24:14 2021] dlm: CEC5E19D749E473B99A0B792AD570441: dlm_recover_locks 0 out
> > >> [Fri Aug 20 16:24:14 2021] BUG: unable to handle page fault for address: ffffdd99ffd16650
> > >> [Fri Aug 20 16:24:14 2021] #PF: supervisor write access in kernel mode
> > >> [Fri Aug 20 16:24:14 2021] #PF: error_code(0x0002) - not-present page
> > >> [Fri Aug 20 16:24:14 2021] PGD 1040067 P4D 1040067 PUD 19c3067 PMD 19c4067 PTE 0
> > >> [Fri Aug 20 16:24:14 2021] Oops: 0002 [#1] SMP PTI
> > >> [Fri Aug 20 16:24:14 2021] CPU: 1 PID: 25221 Comm: kworker/u4:1 Tainted: G        W         5.13.8-1-default #1 openSUSE Tumbleweed
> > >> [Fri Aug 20 16:24:14 2021] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.9.1-0-gb3ef39f-prebuilt.qemu-project.org 04/01/2014
> > >> [Fri Aug 20 16:24:14 2021] Workqueue: dlm_recv process_recv_sockets [dlm]
> > >> [Fri Aug 20 16:24:14 2021] RIP: 0010:__srcu_read_unlock+0x15/0x20

that was suspicious to me and I was looking into the code in v5.13.8
again and found an issue. I believe you are hitting an out-of-bounds
array access of __srcu_read_unlock() while some concurrency handling
was updating the idx parameter which became invalid at that moment.
However the idx handling could be invalid in several other cases. It's
fixed in the current mainline kernel, but v5.13.8 is still broken. I
will send a patch marked as RFC for you. Please test it and report
back, then I will resend it for v5.13.8.

- Alex

