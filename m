Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 60FC43C2293
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Jul 2021 13:09:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1625828972;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=xYve4Fb1ntFTWux0G1qTIZ2JxizD+hkq0PRHg0flbPs=;
	b=P9IylDx0JOHbaLBulGe36x1GnjPfJwkjZZxlZVgapmDLiqTEwcn/vt3Q6O/xTv+0LmnQNt
	RFSIsdNt4ToiqkcOwYXVE5jhcGSPTJB8754FyQB8l/e+OBVD2iyAAR/9VDfhbmI40Whjx3
	rSgOMLXucTaUiuZbsULzzKp7WbxRt+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-WdjgjiKDPJmAH82oQFbZbw-1; Fri, 09 Jul 2021 07:09:30 -0400
X-MC-Unique: WdjgjiKDPJmAH82oQFbZbw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB26C188CBE0;
	Fri,  9 Jul 2021 11:09:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E9DD1036D04;
	Fri,  9 Jul 2021 11:09:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC1244EA2F;
	Fri,  9 Jul 2021 11:09:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 169B7oGU018154 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Jul 2021 07:07:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5AD931054566; Fri,  9 Jul 2021 11:07:50 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56CD110548EF
	for <cluster-devel@redhat.com>; Fri,  9 Jul 2021 11:07:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D174F96B042
	for <cluster-devel@redhat.com>; Fri,  9 Jul 2021 11:07:47 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-427-a-hYYYWPMDK_DMiuriHogw-1; Fri, 09 Jul 2021 07:07:46 -0400
X-MC-Unique: a-hYYYWPMDK_DMiuriHogw-1
Received: by mail-wr1-f72.google.com with SMTP id
	w4-20020a05600018c4b0290134e4f784e8so2752193wrq.10
	for <cluster-devel@redhat.com>; Fri, 09 Jul 2021 04:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=xYve4Fb1ntFTWux0G1qTIZ2JxizD+hkq0PRHg0flbPs=;
	b=tLsGPjamRPpB9b+R8lpGGpKIpfIncSpQRaAKal/lM3/hIJT5KDIw11mQh95Vc6tacC
	u/1uyLou3ktadJzPHfIcYgUP24sCWPE5qCLG/+YoGWJ7r9N5ye140KpBFlkiubOFuLav
	XkANWSbdP9CzT+F4SeZ1urdT2rVjZD78YvndFHdR7kzztdz3ogK6VLUrsZar5r/L7PAA
	retp9rcHkyd+KRhLjBFtT6bUG3WYIWM8U3PnuZvHwH2nnEuoq8f0CFCkNcl/b7IcRFG8
	Yoc1dA5QFDP4Va9OIw9VzzJxEFCNsbQCErKz5DOQl1BlRp+7A7JIH0uRvNlO+869U2TI
	HdCg==
X-Gm-Message-State: AOAM532Jp4OI2G0FsrbnnOPVxyJaE9aQX9jnbpcoUPwD2EYJ5TEGa26O
	CvVWD3Ud2hwfXS3KpgSKkOwNJs6wJfldvIIPmnvvRMKWOB1/PIYhRXLfGLyZI0ix8rzGPRtbl3u
	M6RVweSKEnUdq2EqYcsYczOj2HvJC+rlDoNLgog==
X-Received: by 2002:a5d:64e4:: with SMTP id g4mr34081967wri.377.1625828865437; 
	Fri, 09 Jul 2021 04:07:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzZtBvY49sytJNLAgopkmB9OwR4IxiUX+hELjXilJXJ1NRRzW3Ct/VhrnDt5ViyteCotEe0E+oTQmh13qeHuc=
X-Received: by 2002:a5d:64e4:: with SMTP id g4mr34081948wri.377.1625828865289; 
	Fri, 09 Jul 2021 04:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210707115524.2242151-1-agruenba@redhat.com>
	<20210707115524.2242151-4-agruenba@redhat.com>
	<20210709042934.GV11588@locust>
In-Reply-To: <20210709042934.GV11588@locust>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 9 Jul 2021 13:07:34 +0200
Message-ID: <CAHc6FU5xLZvZ94XTxGeobZ7qebG+tsGd7qkJxnfpvF17YTUSbA@mail.gmail.com>
To: "Darrick J. Wong" <djwong@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: linux-xfs@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH v3 3/3] iomap: Don't create iomap_page
	objects in iomap_page_mkwrite_actor
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 9, 2021 at 6:29 AM Darrick J. Wong <djwong@kernel.org> wrote:
> On Wed, Jul 07, 2021 at 01:55:24PM +0200, Andreas Gruenbacher wrote:
> > Now that we create those objects in iomap_writepage_map when needed,
> > there's no need to pre-create them in iomap_page_mkwrite_actor anymore.
> >
> > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
>
> I'd like to stage this series as a bugfix branch against -rc1 next week,
> if there are no other objections?

Yes, that would help a lot, thanks.

Andreas

