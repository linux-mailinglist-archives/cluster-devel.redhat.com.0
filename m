Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 794103B5DF0
	for <lists+cluster-devel@lfdr.de>; Mon, 28 Jun 2021 14:26:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624883163;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=acP5uzFdW1Ht90PhtySU1kJQyH71L3NOJrM6+TwWOfY=;
	b=gmBed0Q800CqhJlLtcbAkDgJ2Cv/I4dlCrTZ0WrLy8pOOg8FcDssibwZs2jV0/7HqHyUJ9
	bLrBK4R1lVpeyTFvoAMo8s6YlM4hBdYHNmZOjUt8zOZloNNpVym4lK/3PpHH9RZYGfzXXG
	IfjTxaQsAaXyNeJGT/612AB3WMmmGlc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-149-rmBlk9i1Ph2I_sOZu4J_cQ-1; Mon, 28 Jun 2021 08:26:02 -0400
X-MC-Unique: rmBlk9i1Ph2I_sOZu4J_cQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF3C010C1ADC;
	Mon, 28 Jun 2021 12:25:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ED1418AAB;
	Mon, 28 Jun 2021 12:25:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 914C74EA29;
	Mon, 28 Jun 2021 12:25:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15SCO3A3024532 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 28 Jun 2021 08:24:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5A1DF20236F5; Mon, 28 Jun 2021 12:24:03 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55554200D8E8
	for <cluster-devel@redhat.com>; Mon, 28 Jun 2021 12:24:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C28B780D09C
	for <cluster-devel@redhat.com>; Mon, 28 Jun 2021 12:24:00 +0000 (UTC)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
	[209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-357-zizuIAODMkSkm8t6X-lOfQ-1; Mon, 28 Jun 2021 08:23:59 -0400
X-MC-Unique: zizuIAODMkSkm8t6X-lOfQ-1
Received: by mail-wm1-f72.google.com with SMTP id
	u64-20020a1cdd430000b02901ed0109da5fso2947568wmg.4
	for <cluster-devel@redhat.com>; Mon, 28 Jun 2021 05:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=acP5uzFdW1Ht90PhtySU1kJQyH71L3NOJrM6+TwWOfY=;
	b=RyWj6RzQUW3NhwiKMQ+7NpF/TowoeIWjHWAy2MIGYP1F24vBMhIffx5JWnLVyBuUfD
	yQcHS1JzVSAQXVG3/lqK0GF/2LDMk9e4WgDWkJYytU9i+++L4VLcYLSRfZhU1iF0JMxo
	b0Evm/NNaWymaID1DrKOzu4rHS8dpmNc3E0OD2Hd/Jv8NaXcizw21A5PfSN+Khi4Z5pF
	03twCydARSuolTCxmEUdrXr+NvTaNF+/LzHXbDruSX6kJnKCMlYRqWol7BMIKOW4dapY
	UutCFWRKNoQemM9+hkhCF4ifFDbOqcYBVrJRagm8yOz2x/BRF9pwqHYClc8jcGwIn9in
	ccag==
X-Gm-Message-State: AOAM531pSOUj5Nc3XhpNPoT/XDYb2FepeG9aDn0qWhtAC/uL8OnS2I2H
	4R56IN6BECJg/9ytLkDwUy8OVCMZUqXJrUosni2CybhMas4fZkg0CSK5QLGgMTBg7CQ6n3/hbxS
	FCa1yGmSxkB4gdPFvM3H/1smkJuRwq7JjyUG3Qg==
X-Received: by 2002:a05:6000:112:: with SMTP id
	o18mr26070641wrx.289.1624883038190; 
	Mon, 28 Jun 2021 05:23:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyo/u/RlWFBnhPERyzSjcUsQzROXwkNt9wwDHWfNCBSLkyKR9WiZEYIL0/afe/zNzJ6siZ49Vs928PIyYhboMw=
X-Received: by 2002:a05:6000:112:: with SMTP id
	o18mr26070626wrx.289.1624883038028; 
	Mon, 28 Jun 2021 05:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210628111450.194262-1-jingxiangfeng@huawei.com>
In-Reply-To: <20210628111450.194262-1-jingxiangfeng@huawei.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Mon, 28 Jun 2021 14:23:47 +0200
Message-ID: <CAHc6FU5B_bkLyU5T5KEsOr_ds0E30MVyhVdB5ck43n9tg3PRbA@mail.gmail.com>
To: Jing Xiangfeng <jingxiangfeng@huawei.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix error handling in
	init_statfs()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Hi Jing,

On Mon, Jun 28, 2021 at 1:22 PM Jing Xiangfeng <jingxiangfeng@huawei.com> wrote:
> In an error path of init_statfs(), it calls iput to put pn which has been
> put. Jump to correct label to fix it.

thanks for your patch. This looks okay, but I'd rather set pn to NULL
after the iput instead. Since iput(NULL) is a no-op, we'll end up with
the same result.

Andreas

