Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7ACD8265F4B
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Sep 2020 14:12:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599826374;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=WpSJZoDhXU8Bl8cIqyk1fDl2xLvOrmyAbOIbzanIsbk=;
	b=YuTsGejtyC2yF54M1HnROvM4bsfzwyjfyZzAh3YMcmJ0zPnTPta8pOvLwR0OROPqsDRNuK
	DKOQazin87uvCGLCv38h+aJuC8MPHxZXNn7pIXtaZ6EJVcNTgK5ECSmLZ3opH0L6j14e+v
	S/8Suiek3ISn9aTw38JAHHY4EhwA5gk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-4QR-Ney1OSyzWrjgl7YuAQ-1; Fri, 11 Sep 2020 08:12:51 -0400
X-MC-Unique: 4QR-Ney1OSyzWrjgl7YuAQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A2908030CC;
	Fri, 11 Sep 2020 12:12:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FEA95D9F3;
	Fri, 11 Sep 2020 12:12:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F985922F5;
	Fri, 11 Sep 2020 12:12:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08BCCYAF016152 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Sep 2020 08:12:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 92804202450A; Fri, 11 Sep 2020 12:12:34 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D082201E6AC
	for <cluster-devel@redhat.com>; Fri, 11 Sep 2020 12:12:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3337580121C
	for <cluster-devel@redhat.com>; Fri, 11 Sep 2020 12:12:32 +0000 (UTC)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
	[209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-311-63WK11ilMLCVjOuMdGSyEg-1; Fri, 11 Sep 2020 08:12:30 -0400
X-MC-Unique: 63WK11ilMLCVjOuMdGSyEg-1
Received: by mail-wm1-f71.google.com with SMTP id a7so880590wmc.2
	for <cluster-devel@redhat.com>; Fri, 11 Sep 2020 05:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WpSJZoDhXU8Bl8cIqyk1fDl2xLvOrmyAbOIbzanIsbk=;
	b=Gax/jGtoT7DUVfupQe93LGvpK0coUU/D8EWyXPSItxw8JP0axag+CceDHVAqHz9B4u
	xz/SX6oHyuyvEGf6oxT9Pyv4Zv9Fn5m9Jy2zjC0jK/8G+HPjI6iEkEGst+LM43oAvkTH
	YriGAuPPnWsMMarOsP4WleGNw/xXQOH9AVitH+/Zft1+ZfIWjZJEOPHqXrsYK0HqNboF
	/CJvWjrvImuNO4V5wIAt+tqemr5ZOEP4M+JDCjjsftfw9ySNr8DIHvOG2nGcXNTI/uKF
	QAwScVbm9Sk0LbCcYW/JKyj8P/N2QcgE8YzsAqJ1qdOAg7QOqTcQo0pXpHDQ+lL9t9al
	RqXQ==
X-Gm-Message-State: AOAM533Uu+87FwigvlMXxjaeOBCr59kPOmTrsKYxYUKLJFWwViBwWi3y
	OAYcW0DoVdibbjJG7vjbR9sYvG1Oir8uAiTiNJNZl6uDWi8E3+wxA0vBZNPnqCBKNlnE+pbVyle
	pbZTR/ICFb+SfDB4B5jpgE7DojOugJW2VIAfMPA==
X-Received: by 2002:a5d:4e8a:: with SMTP id e10mr1782465wru.329.1599826349296; 
	Fri, 11 Sep 2020 05:12:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2UcPBLQ0l7SPS9t0/toMzg9RpVOraIQlfIv6RFuu9TW58mkfeZOObj5sfwveO+dt5rkefD7fFw5kHsJV91Z4=
X-Received: by 2002:a5d:4e8a:: with SMTP id e10mr1782450wru.329.1599826349139; 
	Fri, 11 Sep 2020 05:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200623195316.864547658@linuxfoundation.org>
	<20200623195323.968867013@linuxfoundation.org>
	<20200910194319.GA131386@eldamar.local>
	<20200911115816.GB3717176@kroah.com>
	<20200911120854.GA221663@eldamar.local>
In-Reply-To: <20200911120854.GA221663@eldamar.local>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 11 Sep 2020 14:12:17 +0200
Message-ID: <CAHc6FU5iH5LdCQA5qGKbu0gqO1p+-A2Dn8XYahXCLJNB4JSqWA@mail.gmail.com>
To: Salvatore Bonaccorso <carnil@debian.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, Daniel.Craig@csiro.au,
	Nicolas Courtel <courtel@cena.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [PATCH 4.19 142/206] gfs2: fix use-after-free
	on transaction ail lists
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 11, 2020 at 2:09 PM Salvatore Bonaccorso <carnil@debian.org> wrote:
> On Fri, Sep 11, 2020 at 01:58:16PM +0200, Greg Kroah-Hartman wrote:
> > Can you report this to the gfs2 developers?
>
> Sure! Bob Peterson and Andreas Gruenbacher were already on the
> recipient list but I forgot cluster-devel@redhat.com .
>
> I can send there a separate report as followup if still needed.

No need right now, we're looking, thanks.

Andreas

