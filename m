Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6232C9283
	for <lists+cluster-devel@lfdr.de>; Tue,  1 Dec 2020 00:29:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1606778967;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=qwePAjO+JoQzIGjZm9jsWctF8D99Rx1DaGUaPJ9flqY=;
	b=K6vD3I9vs56QtTZEPi9Fnr4GEQV1dm5m/pRnmipFAto1CXwrYpR7uZ3TyCC27heLVBCuLW
	n9DnkzvUHNm0A2OmDvp3YJypKHIwPvSR7GJw4BW87fJJynNfkUH/ycUKMtxAMBimd+EQjB
	nlHpE6HEnx7iaVgnjqcZDqhH3ePEh2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-Ts8-7KBePyC_CWbfJfqrEg-1; Mon, 30 Nov 2020 18:29:20 -0500
X-MC-Unique: Ts8-7KBePyC_CWbfJfqrEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A662E8030C2;
	Mon, 30 Nov 2020 23:29:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D12E60C69;
	Mon, 30 Nov 2020 23:29:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5360C4A7C6;
	Mon, 30 Nov 2020 23:29:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AUNTBIX013134 for <cluster-devel@listman.util.phx.redhat.com>;
	Mon, 30 Nov 2020 18:29:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 499F12166B2C; Mon, 30 Nov 2020 23:29:11 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 44BF52166B2B
	for <cluster-devel@redhat.com>; Mon, 30 Nov 2020 23:29:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 023CE8007D9
	for <cluster-devel@redhat.com>; Mon, 30 Nov 2020 23:29:09 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-255-Sk_tvQqtPiGhpGsHVfVReg-1; Mon, 30 Nov 2020 18:29:01 -0500
X-MC-Unique: Sk_tvQqtPiGhpGsHVfVReg-1
Received: by mail-wr1-f71.google.com with SMTP id n13so63579wrs.10
	for <cluster-devel@redhat.com>; Mon, 30 Nov 2020 15:29:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qwePAjO+JoQzIGjZm9jsWctF8D99Rx1DaGUaPJ9flqY=;
	b=RUh4vScTwDfZE2XdkLtRufW18Uh2WY9oxiGOEXFx+QQznaNzlXIN+/dKzFu+2LnbDh
	kSePQQetNMW9eoz3B9lioQCPhwqJk+5Q5aj9dm6kFQeC6ZYICcrECpfCFbLZgmRZjOdl
	etTZWC95rEyDz0zBrCb3ZnIVYOb3N7LIMFjAmvzM90kruj/NcOy81HuqJi1y9zgU423g
	JXFhG62sXhTAPjKUZxAkiyG2TfT8k6Szx+/Tn+9/bsFpuOuMGLYpMnqrNnSPMcGMG2B8
	GbH0giyuDoK3vMDObAWZSKRfwsDpEGLSDxL5dkHDjaWs0gHiVRgHxZlgf3tk1Zf6dx6s
	nKHQ==
X-Gm-Message-State: AOAM5331AQZ1HIAIrddql0PLpcBb1nlScUsfZLu5KG/nEjkSiIRfD/3z
	4vNAMTa/gA1oNAAjkpZD+qmnM0edHkw7LO7a0JydUS6PuWvIoNRzlSdhk3Q+4nVr8OGTp7H162a
	yy5kphCZt3ZQCgrO6HM3zcHGMoIMN4mmhYmrXuQ==
X-Received: by 2002:a1c:810c:: with SMTP id c12mr201931wmd.96.1606778940549;
	Mon, 30 Nov 2020 15:29:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDplTRUudFfAcqGGcEB/r3VSa3uZ3cetM8uY3SP7Vp30Fs+7Sae/U97WuD9sQ0BTHG5vGW41xQ6vEzZCiStqw=
X-Received: by 2002:a1c:810c:: with SMTP id c12mr201871wmd.96.1606778939628;
	Mon, 30 Nov 2020 15:28:59 -0800 (PST)
MIME-Version: 1.0
References: <20201130194422.741935-1-agruenba@redhat.com>
In-Reply-To: <20201130194422.741935-1-agruenba@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 1 Dec 2020 00:28:48 +0100
Message-ID: <CAHc6FU7zCJmmMXsAzpg1=f8xM68QrH6hV747JYaT8r2tMrKQQA@mail.gmail.com>
To: cluster-devel <cluster-devel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: cluster-devel@redhat.com
Cc: stable <stable@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH] gfs2: Fix deadlock between
	gfs2_create_inode and delete_work_func
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 30, 2020 at 8:44 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
> In gfs2_create_inode, make sure to cancel any pending delete work before
> locking the inode glock.  Otherwise, gfs2_cancel_delete_work may block
> waiting for delete_work_func to complete, and delete_work_func may block
> trying to acquire the inode glock in gfs2_inode_lookup.

(Please see version 2 of this patch.)

Thanks,
Andreas

