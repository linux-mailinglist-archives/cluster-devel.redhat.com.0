Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E994AF462
	for <lists+cluster-devel@lfdr.de>; Wed,  9 Feb 2022 15:47:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644418073;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=JY2QOI+Iy4bl7rWBaNbqVUTyeNT8xyZSYBfnst/3Fi8=;
	b=IcX+mPqH0sG6jtWW7HpjpSYMJemup4URNLbpSiUeAyIwuehYIX2rYozN92Um2u0Wvv4lS9
	WEfbf40TrdCmVSzwWg5KJlJQSl2fMs8BhTQwLdHCJhdT05smR+u+spJdeOmoa92S6TWf4G
	xWaOZMGJeKVzwKuGXNtCOJrca1LK0Ks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-GW36s0lqOVqBY6c6Tr7Rcg-1; Wed, 09 Feb 2022 09:47:49 -0500
X-MC-Unique: GW36s0lqOVqBY6c6Tr7Rcg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F97319251A8;
	Wed,  9 Feb 2022 14:47:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0829678AAA;
	Wed,  9 Feb 2022 14:47:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D7D24A705;
	Wed,  9 Feb 2022 14:47:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 219Ejrxk003014 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 9 Feb 2022 09:45:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 502A0112132E; Wed,  9 Feb 2022 14:45:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A3A31121331
	for <cluster-devel@redhat.com>; Wed,  9 Feb 2022 14:45:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC1C63C01B83
	for <cluster-devel@redhat.com>; Wed,  9 Feb 2022 14:45:49 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
	[209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-443-yVv6Uw4pMjKcxehChs2rcQ-1; Wed, 09 Feb 2022 09:45:48 -0500
X-MC-Unique: yVv6Uw4pMjKcxehChs2rcQ-1
Received: by mail-qt1-f197.google.com with SMTP id
	x5-20020ac84d45000000b002cf826b1a18so1896501qtv.2
	for <cluster-devel@redhat.com>; Wed, 09 Feb 2022 06:45:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JY2QOI+Iy4bl7rWBaNbqVUTyeNT8xyZSYBfnst/3Fi8=;
	b=4GIGEM4iFO4reTBWrktzC9fqHRFJq6UIkkyjynl3NV7r5PDk348ayJepJv7BgVRC16
	HSjRS+64eTEzo591lRxdI1FC4WmzDfmSfdaV1mMK5Qx7OflQIbd8+0uxEUXDBWm6OEZb
	g6m5PuqcnltszI/EIz4eO/aszaa81HuErjUeVJcyj8aR3h/K2CP+qX5FB7xKl8U+JW/2
	C71DXtG32FrpbgpzNsUCHeNSHok9xPHMPXkl4qvQYhNvVPtP+v3UA+WvyE2RhIdvnunT
	d58sesJ7XDed42Tgd4eDXG4WjbwYNZ5fGARWWYz5HX1xpMsWn0V50aVIADEkK1OVNKYB
	UOAQ==
X-Gm-Message-State: AOAM530o9Yk5dgaDzJYxe6KUlNaOaS2tH4RgkQGQ/My1JeL1Zl5PHNgD
	pchhgsiOYbTF8aIFQfdC6zJnV6uOYfwxaI9RYowjlsSsQeEGIyZzglwbE2vGUUVsgphzNwKuL0R
	VoGsMqU/Yp7mO+MWCFwmZVKV64F4gWt8uWjaRUg==
X-Received: by 2002:a05:6214:1d05:: with SMTP id
	e5mr1721024qvd.28.1644417947958; 
	Wed, 09 Feb 2022 06:45:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3Pw8hHsTaHtSjJPG6s1ynZEgAS5dC4oYu1VNiZhNMcxfk/psVQW0jk331GFw4NxbKiUPv0D2BncDYmPOePQ8=
X-Received: by 2002:a05:6214:1d05:: with SMTP id
	e5mr1721015qvd.28.1644417947762; 
	Wed, 09 Feb 2022 06:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20220208213749.997455-1-aahringo@redhat.com>
	<20220208213749.997455-2-aahringo@redhat.com>
In-Reply-To: <20220208213749.997455-2-aahringo@redhat.com>
From: Alexander Aring <aahringo@redhat.com>
Date: Wed, 9 Feb 2022 09:45:36 -0500
Message-ID: <CAK-6q+jNmbupVi9qfLD5+BPRcz9hr_dBdreKuyBS2XFUZC7SMw@mail.gmail.com>
To: David Teigland <teigland@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH dlm-tool 1/3] treewide: do always -Wl, -z,
	now in LDFLAGS
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, Feb 8, 2022 at 4:38 PM Alexander Aring <aahringo@redhat.com> wrote:
>
> This patch reverts commit 7bb5570a ("treewide: try to resolve symbols at
> linking time") because the recommended why to avoid security related

s/why/way/

I will push them to the dlm repository.

- Alex

