Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id F40CFFCFAE
	for <lists+cluster-devel@lfdr.de>; Thu, 14 Nov 2019 21:29:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573763394;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gcPgyF2vMj9snII23fry/P5zg/OuM7w4CTMcHf3oW9Q=;
	b=i0/R99j592pcSQtAiTGgXIn+Cx/mVH0rmZZGhKoZJYJXgEbNEcITWRC7Cn9SrYao5RVX86
	K0GtS6LSrYjGR2fTOYqqAMB+P/Wt2w8gYW688O0qOMb2wWyl8IvkQlqkXE/2R430AOxMRu
	uw4jijj0Qcm2eoVzqX6CL+mlTmtLJsk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-6BqPL0LQO3WBoVHKEtV_lQ-1; Thu, 14 Nov 2019 15:29:53 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7871F18B5F68;
	Thu, 14 Nov 2019 20:29:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 121CE9472;
	Thu, 14 Nov 2019 20:29:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5843B18089CD;
	Thu, 14 Nov 2019 20:29:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAEKSrhO011425 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 14 Nov 2019 15:28:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7BCF96F9E6; Thu, 14 Nov 2019 20:28:53 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77F696F9D8
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 20:28:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F9DE800261
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 20:28:51 +0000 (UTC)
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
	[209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-431-ttjqduo8Pn64OpuBhErLeA-1; Thu, 14 Nov 2019 15:28:50 -0500
Received: by mail-ot1-f71.google.com with SMTP id h15so4001792otr.11
	for <cluster-devel@redhat.com>; Thu, 14 Nov 2019 12:28:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gcPgyF2vMj9snII23fry/P5zg/OuM7w4CTMcHf3oW9Q=;
	b=CAORNFbAeObDQ4fbuF6CjPkzF+PGxzGF7aSJbiOannrEBjBDCjqrjJHkK+M8iJ6nzA
	EW9LU4gkbGIdHLWUM3GHBUDUH514ovvoL4LdmWL7HW/t+SSEVPrnzQe61Cidob7xd94d
	LqMvRuPSG4R6wxLmw9JM4+Q4UtOg2JqXN7PlhFm9qKpk7MrWmceI/EmCjFFq82F5GZV4
	3WCUEvt8O/B4He+AGFYFoCMnKcMGJEMqJXSSGkk6fgfX60X4NlW0Bv7TB8R1z8j6bAK8
	v5o7062FZEVNdzg4afpSgBF2Ow6TrkPtoas3jKWOOHSiXOvFYVW4VrIdwjr66plpHWnk
	aRhw==
X-Gm-Message-State: APjAAAWkPN2+X1ZiQfYtsHOMCpKy46gWeNgzE6Ie6jAc601txA2EQb4i
	D97BWw1cXaGrPhWmxWzRynS1UwhMjvAm38Tg1mwS9808C29rFBoa9xsW7LSNy5eHu2UG3Wp/HQw
	nUpGqB9rJpVT3AIuU6o0vTCu8/sPssQg3QV12Gw==
X-Received: by 2002:aca:d6d7:: with SMTP id n206mr5139748oig.147.1573763329361;
	Thu, 14 Nov 2019 12:28:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqwno8EhizXXwBTWdXuwg7urtj7l/QLcdsN4IYZLTaKVu8tziRnMniH3vx2SmG50biTlsCu5PNBg43EYRpYDpoc=
X-Received: by 2002:aca:d6d7:: with SMTP id n206mr5139740oig.147.1573763329179;
	Thu, 14 Nov 2019 12:28:49 -0800 (PST)
MIME-Version: 1.0
References: <946265143.29711102.1573742986193.JavaMail.zimbra@redhat.com>
	<788089991.29722188.1573743135983.JavaMail.zimbra@redhat.com>
	<CAHc6FU7-2qUokPXwRGBZPTRrv2xRkE47d8KYXGmUCkN3wVnyNw@mail.gmail.com>
	<429182855.30077979.1573757627399.JavaMail.zimbra@redhat.com>
In-Reply-To: <429182855.30077979.1573757627399.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Thu, 14 Nov 2019 21:28:38 +0100
Message-ID: <CAHc6FU6J4E_xMxAfxOfe1CoFYmTAFPPHFsG8_X4MBOvsHbXJMw@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-MC-Unique: ttjqduo8Pn64OpuBhErLeA-1
X-MC-Unique: 6BqPL0LQO3WBoVHKEtV_lQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAEKSrhO011425
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: Introduce function
	gfs2_withdrawn
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2019 at 7:53 PM Bob Peterson <rpeterso@redhat.com> wrote:
> Well, I can certainly do that, but this patch is a predecessor to
> another that checks two bits instead of one. I could or them, of course.

Yes, what's wrong with return A || B?

Thanks,
Andreas


