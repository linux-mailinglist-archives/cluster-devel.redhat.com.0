Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6ADA726BDF5
	for <lists+cluster-devel@lfdr.de>; Wed, 16 Sep 2020 09:29:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600241352;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=SB1wk+nAtqosRYctKp+oitj3bhHJSKNwOnYr1XT96tY=;
	b=BvfQsgBkLkN4aDy+lpH5BG6Tbd3ZqxsjGxnXGXxBuEO8Gc5yo9b4E1W8cYSZXb33+oBxEM
	6Ub85A2njvGrmGIodLz2Y/WhndRV2W/HUZJeJTjRqOj8U4V1Xltr/mL3jP2o6ka5+2B399
	2SSvmErs9vVswWKfjoBnkZnuVkhNkzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-gCPF_rxpMUS_J2na6T77IQ-1; Wed, 16 Sep 2020 03:29:10 -0400
X-MC-Unique: gCPF_rxpMUS_J2na6T77IQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 436E380ED9A;
	Wed, 16 Sep 2020 07:29:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 250822C31E;
	Wed, 16 Sep 2020 07:29:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D2EE344A65;
	Wed, 16 Sep 2020 07:29:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08G7SBYQ023902 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 03:28:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 56DE910EE823; Wed, 16 Sep 2020 07:28:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52E3D10EE822
	for <cluster-devel@redhat.com>; Wed, 16 Sep 2020 07:28:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C81B89063AB
	for <cluster-devel@redhat.com>; Wed, 16 Sep 2020 07:28:07 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
	[209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-325-n8LDNhsqMbqw-lqEsLZ_cw-1; Wed, 16 Sep 2020 03:28:06 -0400
X-MC-Unique: n8LDNhsqMbqw-lqEsLZ_cw-1
Received: by mail-wm1-f70.google.com with SMTP id w3so677555wmg.4
	for <cluster-devel@redhat.com>; Wed, 16 Sep 2020 00:28:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SB1wk+nAtqosRYctKp+oitj3bhHJSKNwOnYr1XT96tY=;
	b=Z7mSMQ372rmLTS8V1aDDW3yamvabVk7XQriKYvrCrbH2tc96xH7Sa4+IGN9FH5lxNp
	adW1sVx7BySYIuq9XBrEGZJbFgUzSJ6GL6z9FvSZDawFf97jMm9tm/IttaI6xYH6pau9
	rOoeD5y24F8gIdYuZN71OyU3JY45D1RGY8DFlDiiY7y+H9lKKf0DjmfInwLVOL4vJROG
	RcVSj7TOS35gRwdtE/NSxbs4IXCTdiCFfzlZvCSCn2ytgJ1KKJ3xmQxzJSlF/S+GmvQv
	WSvxLSxkWhUJQ+/JU9tkMT8qUuu7qn6mpmKM6gUPOv79XoVs0cpgYtonMzgTuNzJkbcO
	uQQw==
X-Gm-Message-State: AOAM531jPZos1hJoyt1pTKLYbQ+WlB7a/viVPkDNSM4V1miML/dU4B0Y
	21mbd5TzcLfTI4md9AW5xo5PqUwuVpNTCqL+y0oi0XN3rQs4vb9LkKqyu3HCxPKfhP2uRdpJNnR
	AMTQhJnF91Qy+x+1d5dv+XorWrjJ05leW9Vhlkw==
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr3129288wmh.152.1600241284933; 
	Wed, 16 Sep 2020 00:28:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8chO+fK9Z/WXz8qpzx6meYT9jxTImOy+DgfTD3XpNwRa1gka/HWHjUkBSa4jYpi/iNjHpQA43wCxcWKmF5LE=
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr3129278wmh.152.1600241284750; 
	Wed, 16 Sep 2020 00:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200916025021.3992575-1-liushixin2@huawei.com>
In-Reply-To: <20200916025021.3992575-1-liushixin2@huawei.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 16 Sep 2020 09:27:53 +0200
Message-ID: <CAHc6FU4G25w6-YUHKObC_ASdUPWG-Psg6+ODzMPfqr+VYwT3Uw@mail.gmail.com>
To: Liu Shixin <liushixin2@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH -next] gfs2: convert to use
	DEFINE_SEQ_ATTRIBUTE macro
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hello Liu,

On Wed, Sep 16, 2020 at 4:44 AM Liu Shixin <liushixin2@huawei.com> wrote:
> Use DEFINE_SEQ_ATTRIBUTE macro to simplify the code.

I've pushed this to for-next.

Thanks,
Andreas

