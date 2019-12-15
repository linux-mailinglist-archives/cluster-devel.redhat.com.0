Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0E98611FAD7
	for <lists+cluster-devel@lfdr.de>; Sun, 15 Dec 2019 20:51:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576439464;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6tVaOgyXatmQH26p7/caUrdng9JSMRx7S2qrCQnm7LY=;
	b=SGc+3lL8GpDHzKGNIZ/RvueAYJ48iqv7VZi3nayUKSOMLW+YdZ4TH5QepK0XTb/O909vMl
	v4m7yn+VyYcX3T/ZYjp/tMM0oddjT8ULGHJfn5mJNViTOmCOnxlb7xG2sAyysk1yOQF/SL
	Z7NRdyWr6oihE+8s5FFOP6SA+DadTNQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-fTSmWYNnNsmagoEEeWbrcg-1; Sun, 15 Dec 2019 14:51:02 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7EAF3800D48;
	Sun, 15 Dec 2019 19:50:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D5F6A4B8F;
	Sun, 15 Dec 2019 19:50:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6BB7118089CD;
	Sun, 15 Dec 2019 19:50:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBFJoiOa005687 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 15 Dec 2019 14:50:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 99EBD2038B80; Sun, 15 Dec 2019 19:50:44 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94E892026D68
	for <cluster-devel@redhat.com>; Sun, 15 Dec 2019 19:50:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 33F718E5C6A
	for <cluster-devel@redhat.com>; Sun, 15 Dec 2019 19:50:42 +0000 (UTC)
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
	[209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-163-X2f1IDnhNvKmxICXf2vlBg-1; Sun, 15 Dec 2019 14:50:40 -0500
Received: by mail-oi1-f198.google.com with SMTP id c8so4703519oif.22
	for <cluster-devel@redhat.com>; Sun, 15 Dec 2019 11:50:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6tVaOgyXatmQH26p7/caUrdng9JSMRx7S2qrCQnm7LY=;
	b=XjiNq2/NfYeKq+3tk9rm0moaxvoH9JZdf387XCbMaI9LqF+PxL4fAK29UoaPXOjMb0
	kZyLSxlZsldHGIzbGMLmMKyXhAI7m1A+1N8Sg83wpjs3Mu7oCQjX1+J9pbIYpU4+nIHB
	uUwSvYUl4/cEUC1m82aS49mY5jFUA9Nh4N4/nny3LdCBPo0pZ6PgQvrN3SzZxASL3tkM
	hi3auoLHzb0got7FRG+zVBeJoXcussw16VB+psvk70WDj9QbC6N529X52BIIPfrZDxLd
	GUY8fLFdn8sUvKAOwXXqRixPEhB381yAoOdmOk1ZwNd4V4oxllNI6gTHWc3q65jrI83Z
	u1iQ==
X-Gm-Message-State: APjAAAWnVMhYl0nyiAlx1xAZYT7JeidPwxqpDdh8R89ONa5OSJ7CCdil
	ee6FAox75LKhiBCzn6mzrcAg5Vp5H0twowCb0U/UOvXUAp/pVQoARsQ2jPfmfkgTgaWrFqnW3xY
	ULUVdLakW6sg++QF5j1E/EkQ8czPxo/QR0x2Mzg==
X-Received: by 2002:a05:6830:1707:: with SMTP id
	7mr28936244otk.185.1576439439637; 
	Sun, 15 Dec 2019 11:50:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqy8azUFsS0YiLJx5qdyennHbE2ZU2iqv+ztns6y8ioGhrrofGwHueFOtN7YNmlzbK8vpsYZm2HnSq+RUteKGSk=
X-Received: by 2002:a05:6830:1707:: with SMTP id
	7mr28936223otk.185.1576439439504; 
	Sun, 15 Dec 2019 11:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20191215164621.25828-1-pakki001@umn.edu>
In-Reply-To: <20191215164621.25828-1-pakki001@umn.edu>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Sun, 15 Dec 2019 20:50:28 +0100
Message-ID: <CAHc6FU6rduNDcS7Y6UiWm6EuuwxnVd+75ydG1jW4rfE-kLn4Sw@mail.gmail.com>
To: Aditya Pakki <pakki001@umn.edu>
X-MC-Unique: X2f1IDnhNvKmxICXf2vlBg-1
X-MC-Unique: fTSmWYNnNsmagoEEeWbrcg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBFJoiOa005687
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>, kjlu@umn.edu,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] gfs2: remove assertion when
	journal_info is not empty
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Aditya,

On Sun, Dec 15, 2019 at 5:46 PM Aditya Pakki <pakki001@umn.edu> wrote:
> In gfs2_trans_begin, avoid crashing when current->journal_info
> is not empty. The patch fixes  the error by returning -EINVAL
> instead of crashing.

can you please explain when that patch is needed? Do you have a test
case to reproduce?

Thanks,
Andreas


