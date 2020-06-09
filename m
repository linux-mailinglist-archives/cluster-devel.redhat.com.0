Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 89CB51F3DFC
	for <lists+cluster-devel@lfdr.de>; Tue,  9 Jun 2020 16:23:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591712634;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=eUNdfPEWVXZ411ehxiQndoCFXsS7gdCBSc1nLHLeVjM=;
	b=SyUn4lhU0FykQaW63Ez+qq2Q1sz9hN8mXCJ99UrEhRqdHqlIaGdFj17HsiEUy/UcnSwF/g
	eMIRAOgltpyk+xZ1aPK3Vsa6KKJrpuB71ZlGMn2KxYjFWljaCLWlZp4Z07SX2Fte0trKpT
	nv7SbuqJPePhxRohIfYHgvWDvMndcIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-gLtp1fPRNimJFDRHzAdlVg-1; Tue, 09 Jun 2020 10:23:53 -0400
X-MC-Unique: gLtp1fPRNimJFDRHzAdlVg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 573191B18BD9;
	Tue,  9 Jun 2020 14:23:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 469855D9E4;
	Tue,  9 Jun 2020 14:23:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E5A69B349E;
	Tue,  9 Jun 2020 14:23:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059ENjuB009781 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 10:23:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F70EE5966; Tue,  9 Jun 2020 14:23:41 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7BB78EE380
	for <cluster-devel@redhat.com>; Tue,  9 Jun 2020 14:23:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 233D181DA9C
	for <cluster-devel@redhat.com>; Tue,  9 Jun 2020 14:23:37 +0000 (UTC)
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
	[209.85.167.199]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-56-J4v4wVVwPAixquaoWtt9sg-1; Tue, 09 Jun 2020 10:23:35 -0400
X-MC-Unique: J4v4wVVwPAixquaoWtt9sg-1
Received: by mail-oi1-f199.google.com with SMTP id x67so10607557oix.21
	for <cluster-devel@redhat.com>; Tue, 09 Jun 2020 07:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eUNdfPEWVXZ411ehxiQndoCFXsS7gdCBSc1nLHLeVjM=;
	b=QBdKmC9hwOESlwQoBROJgsdjrb24MT72LQyFjQUE6SCRugNVMxLLKlGpSKPYd3YHqy
	bv59ILRnmXFR+batUtj5nggiNpQyQae6VELwGitRkE1ibi4tNlsc/juOpG+pxx1365Ot
	zP1cDaB2xUlASIRIpgnG9m4ECtMYamhnXp0udKDVBB3a1kwQx0q2L7o5JVxgAFPsjGV7
	PsaFT42xZsg9FRQSWIlGckf2KuQGkqF6ve8MTDqT1Nl57eDksYXOr+kXmkbTirRTn9K0
	DQgZcfzLfM/NcAkebWRvKvdc+dkMvW6C48yS/YgehQgDcoouyZWLJDBOF+WpdlIh38LH
	ULhQ==
X-Gm-Message-State: AOAM530MYYPk0OsNem+f1FejKG0DBLV6CX7yXBAzYTm8GgVUSbm+lnJd
	ze8DfDNb/v3JTg6C2+s5YR4MqyX0DPOVLCgh8YDZuCfN3xKic++IndLLB012wGBGjAHh40/wtn1
	nw+CsN+9zMFJq3bOU2InCbf0rxcwuA2gQQ5EWlA==
X-Received: by 2002:aca:5049:: with SMTP id e70mr3726894oib.72.1591712614351; 
	Tue, 09 Jun 2020 07:23:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9ts52Wv7mtF2NklV+c2+j/K+ciye0NNmFIIA2EcLb10QlQCQlQyICqL5sLfr+c8E7BwceUvx1mk5vcDGtX7I=
X-Received: by 2002:aca:5049:: with SMTP id e70mr3726869oib.72.1591712614079; 
	Tue, 09 Jun 2020 07:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <181861383.32913711.1591710911880.JavaMail.zimbra@redhat.com>
	<d9b2cb1b-c190-4945-ff3a-b6fd1fd61803@redhat.com>
	<439170501.32917657.1591712093863.JavaMail.zimbra@redhat.com>
In-Reply-To: <439170501.32917657.1591712093863.JavaMail.zimbra@redhat.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Tue, 9 Jun 2020 16:23:22 +0200
Message-ID: <CAHc6FU6ZLjuU9iygRT1QG232zJaOJ_F8K8-+nsaAH-GPbac_Fw@mail.gmail.com>
To: Bob Peterson <rpeterso@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH] gfs2: fix trans slab error when
 withdraw occurs inside log_flush
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 9, 2020 at 4:15 PM Bob Peterson <rpeterso@redhat.com> wrote:
> ----- Original Message -----
> > I'm not sure quite what the aim is here... are you sure that it is ok to
> > move something to the AIL list if there has been a withdrawal? If the
> > log flush has not completed correctly then we should not be moving
> > anything to the AIL lists I think,
> >
> > Steve.
>
> Yes, I'm sure it's okay in this case. We only add it temporarily to the
> ail1 list so that function ail_drain() finds and removes it like the rest.
>
> I only coded it this way because Andreas didn't like my somewhat longer
> previous implementation, which follows.

Note that this previous version fails to free the gfs2_bufdata objects
attached to the transaction if the transaction isn't on one of the ail
lists.

Andreas

