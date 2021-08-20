Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 958433F2D4B
	for <lists+cluster-devel@lfdr.de>; Fri, 20 Aug 2021 15:41:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1629466910;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4KjTjMbm6Ax2NoBz/SV8LRb7ROzLCYCzwIW7Ojvzm8c=;
	b=bph3rXS5GK3XFQaxTQXkxX+4WhKDwOVx5bn5ywlRJJDhLvuPxZXWQjPiONAZbz1I7SPu1i
	jwBJN41gaQrEbvgbCgTIcGbiuc8I2qqdIVx6kuhSGrMwEkEX30ltbqgIb1V91mKtMmz9To
	YA2wTCvdBMCD91Pfb9/02Qq8cM5Dwko=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-DvQTM1FCM52Q0umF73w5bA-1; Fri, 20 Aug 2021 09:41:49 -0400
X-MC-Unique: DvQTM1FCM52Q0umF73w5bA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9617A87D548;
	Fri, 20 Aug 2021 13:41:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 827B56A8FE;
	Fri, 20 Aug 2021 13:41:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6DF644A7CA;
	Fri, 20 Aug 2021 13:41:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 17KDfiok020272 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 20 Aug 2021 09:41:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF7B51054594; Fri, 20 Aug 2021 13:41:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAF3310545B2
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 13:41:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12C8A185A7A4
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 13:41:38 +0000 (UTC)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
	[209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-595-3FC98ZL0MS2BH8Q40nmhsA-1; Fri, 20 Aug 2021 09:41:34 -0400
X-MC-Unique: 3FC98ZL0MS2BH8Q40nmhsA-1
Received: by mail-ej1-f69.google.com with SMTP id
	ja25-20020a1709079899b02905b2a2bf1a62so3727427ejc.4
	for <cluster-devel@redhat.com>; Fri, 20 Aug 2021 06:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=4KjTjMbm6Ax2NoBz/SV8LRb7ROzLCYCzwIW7Ojvzm8c=;
	b=NYZg9vVupmxsV0z6W9kWui6qjMOfiympNfW/YiFnv4SGdJUeCQBTxoNHD74W326aC/
	RGEuFNv+s7qta2dFlZMtPtxcJMMf0JTOFNg79ZBJOUfg5TEdvC0gyBIDOWYiZn34ix5Z
	D4vIe55aaaCec8vZO+4MiBJg75TpxzB9qL3mL+WoRlAAiWOamBirhmn6AQQaTYtPJU7C
	/Bir6OAmc24CFo+ehJTN94PQqmTXIn6c1Hl73DxO1F4MiprczJjE8yggtcmkmL+ZX/xL
	zwTK5Jv2c7LS0Gy1Ttt0LAPPn+vhjuW/sZo++GM8w2fSzYqcpCPAlYM05SAMaHfxPLAX
	OMJA==
X-Gm-Message-State: AOAM5318qdPnFQPmGeErIvDcsNBbXwiHOQzU7L9UvbUk4OOHq6cS+IRY
	zKAEJEbOmdooIlY6lg2a83ucNpa/jbZU3kGOVpVM/aFDwqU+JQirh2ip/C7vAONH66oBT8teSHw
	/convVjJYBeO45OpCz/bMQQ==
X-Received: by 2002:aa7:db8b:: with SMTP id u11mr22178960edt.362.1629466893416;
	Fri, 20 Aug 2021 06:41:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx0hLwN+s7rk8F847DLOmn4dy1Ao93kGJxxgV8+oY8fbxG+6Lejz40d6vR1Ye9lqW0fsphjXg==
X-Received: by 2002:aa7:db8b:: with SMTP id u11mr22178939edt.362.1629466893221;
	Fri, 20 Aug 2021 06:41:33 -0700 (PDT)
Received: from
	0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa
	(0.7.3.c.2.b.0.0.0.3.7.8.9.5.0.2.0.0.0.0.a.d.f.f.0.b.8.0.1.0.0.2.ip6.arpa.
	[2001:8b0:ffda:0:2059:8730:b2:c370])
	by smtp.gmail.com with ESMTPSA id
	g14sm3636121edr.47.2021.08.20.06.41.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Aug 2021 06:41:32 -0700 (PDT)
Message-ID: <2508f12f0d2a5eedaad0c6b77657f53222b33e3c.camel@redhat.com>
From: Steven Whitehouse <swhiteho@redhat.com>
To: Bob Peterson <rpeterso@redhat.com>, Andreas Gruenbacher
	<agruenba@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Christoph Hellwig
	<hch@infradead.org>, "Darrick J. Wong" <djwong@kernel.org>
Date: Fri, 20 Aug 2021 14:41:32 +0100
In-Reply-To: <cf284633-a9db-9f88-6b60-4377bc33e473@redhat.com>
References: <20210819194102.1491495-1-agruenba@redhat.com>
	<20210819194102.1491495-11-agruenba@redhat.com>
	<5e8a20a8d45043e88013c6004636eae5dadc9be3.camel@redhat.com>
	<cf284633-a9db-9f88-6b60-4377bc33e473@redhat.com>
Organization: Red Hat UK Ltd
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, ocfs2-devel@oss.oracle.com
Subject: Re: [Cluster-devel] [PATCH v6 10/19] gfs2: Introduce flag for glock
 holder auto-demotion
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
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 2021-08-20 at 08:11 -0500, Bob Peterson wrote:
> On 8/20/21 4:35 AM, Steven Whitehouse wrote:
> > Hi,
> > 
> > On Thu, 2021-08-19 at 21:40 +0200, Andreas Gruenbacher wrote:
> > > From: Bob Peterson <rpeterso@redhat.com>
> > > 
> > > This patch introduces a new HIF_MAY_DEMOTE flag and
> > > infrastructure
> > > that
> > > will allow glocks to be demoted automatically on locking
> > > conflicts.
> > > When a locking request comes in that isn't compatible with the
> > > locking
> > > state of a holder and that holder has the HIF_MAY_DEMOTE flag
> > > set,
> > > the
> > > holder will be demoted automatically before the incoming locking
> > > request
> > > is granted.
> > > 
> > I'm not sure I understand what is going on here. When there are
> > locking
> > conflicts we generate call backs and those result in glock
> > demotion.
> > There is no need for a flag to indicate that I think, since it is
> > the
> > default behaviour anyway. Or perhaps the explanation is just a bit
> > confusing...
> 
> I agree that the whole concept and explanation are confusing.
> Andreas 
> and I went through several heated arguments about the symantics, 
> comments, patch descriptions, etc. We played around with many
> different 
> flag name ideas, etc. We did not agree on the best way to describe
> the 
> whole concept. He didn't like my explanation and I didn't like his.
> So 
> yes, it is confusing.
> 
That seems to be a good reason to take a step back and look at this a
bit closer. If we are finding this confusing, then someone else looking
at it at a future date, who may not be steeped in GFS2 knowledge is
likely to find it almost impossible.

So at least the description needs some work here I think, to make it
much clearer what the overall aim is. It would be good to start with a
statement of the problem that it is trying to solve which Andreas has
hinted at in his reply just now,

Steve.


