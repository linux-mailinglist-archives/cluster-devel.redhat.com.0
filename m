Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EFD7D13BB3A
	for <lists+cluster-devel@lfdr.de>; Wed, 15 Jan 2020 09:38:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579077491;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=afP2TQBI23SB0l49cv2gaQfLmokMsOcSkom1WDiLHKc=;
	b=GItpnEaem1Wj+hLsPdBt2NsLxLl93E1V0acraLrmbNteCO0iRVUDqBJfhMFGrWPO/udiyU
	lVBKNVksGz46DXSefiiKfJiHsNPoHAYIlryJT0tN9ukEZ/rfwXF8e6dE7iRWcENvQusKJJ
	4he30y/uKWM/X9JNLqJ+RbaIpWkuI3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-PlZB1MjbMGiLGPKO4o3lQg-1; Wed, 15 Jan 2020 03:38:09 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9242718FF677;
	Wed, 15 Jan 2020 08:38:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E0A81084194;
	Wed, 15 Jan 2020 08:38:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CD765824EC;
	Wed, 15 Jan 2020 08:38:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00F8c1l3017938 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 03:38:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CC5D2E38DF; Wed, 15 Jan 2020 08:38:01 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C87679D46
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 08:37:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 504C8101D24C
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 08:37:59 +0000 (UTC)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
	[209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-291-Z4X754oRPoO6-U1yCrajNQ-1; Wed, 15 Jan 2020 03:37:57 -0500
Received: by mail-ot1-f69.google.com with SMTP id l13so9551464otn.18
	for <cluster-devel@redhat.com>; Wed, 15 Jan 2020 00:37:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=afP2TQBI23SB0l49cv2gaQfLmokMsOcSkom1WDiLHKc=;
	b=lIvxQD3o5Wr7vnYBJXeoEWgt8bJ7ICV86GBlO1zbA1mQFxr42MR8R0dC9AzhCm/Rs+
	szWOkGC5UIaXF6cPeKugHg+6MnIZI+WMWVi/Ok53o7SiX48beeZtI9VIYR/3/mBx90rX
	QxD68pNErQf+UG3Pnquk8yyMFIZepzz6YjWutnJ9j4HosFsmowaX8lOwYELbj5rZUrKZ
	g/es40BAJsZU5boPd3X6yhkJ97Idv5p6as59Pp5Mzd8QoHzR3iPfBZRR/OEw6ZFrBCkW
	wGIA4a1VgTbuKlnsIn1Rmvw59h56PHNbjvjmAlEQ+QoDYx9c2DTMkkjouhpmnLYz53G/
	hrkQ==
X-Gm-Message-State: APjAAAUoGVwgZl7vKuws2A03cr0DaB+8fHP0o8aEcAk+0vX+5J73cAWo
	AyQeJUoLhi9k2Dt3BD+M7LGymnpJqghs7ZNMft0vxK0ks/wTMb4cyJq/4m6YFCasbsNzu32o08y
	2tBgPdup7L0c6iRHrbuBOodvu2WikQdnLexkn3A==
X-Received: by 2002:aca:50cd:: with SMTP id
	e196mr20104436oib.178.1579077476505; 
	Wed, 15 Jan 2020 00:37:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqwiI97q1T5xZpBV7jFmvIkxDW4O0to9cM1Z+HqL1fogsTVnxNN1+TTswSLfjd2QvLht3EsAFanFl7j6dDQuAYk=
X-Received: by 2002:aca:50cd:: with SMTP id
	e196mr20104429oib.178.1579077476323; 
	Wed, 15 Jan 2020 00:37:56 -0800 (PST)
MIME-Version: 1.0
References: <20200115082744.32176-1-agruenba@redhat.com>
In-Reply-To: <20200115082744.32176-1-agruenba@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 15 Jan 2020 09:37:44 +0100
Message-ID: <CAHc6FU6=__b_5LzPgbTP_tGpo3wFzfckxFvdd1Ti-hsGdrAExA@mail.gmail.com>
To: cluster-devel <cluster-devel@redhat.com>
X-MC-Unique: Z4X754oRPoO6-U1yCrajNQ-1
X-MC-Unique: PlZB1MjbMGiLGPKO4o3lQg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00F8c1l3017938
X-loop: cluster-devel@redhat.com
Subject: Re: [Cluster-devel] [PATCH] gfs2: Avoid access time trashing in
	gfs2_inode_lookup
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Oops, sorry for the duplicate post.

Andreas


