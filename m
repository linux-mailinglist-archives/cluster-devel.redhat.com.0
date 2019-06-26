Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3FC56A4C
	for <lists+cluster-devel@lfdr.de>; Wed, 26 Jun 2019 15:23:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 69DE45945D;
	Wed, 26 Jun 2019 13:23:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BC8C60856;
	Wed, 26 Jun 2019 13:23:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 72B661806B0F;
	Wed, 26 Jun 2019 13:22:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5QDHvfD009439 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 26 Jun 2019 09:17:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 701D65DA35; Wed, 26 Jun 2019 13:17:57 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A89F5D9DE
	for <cluster-devel@redhat.com>; Wed, 26 Jun 2019 13:17:54 +0000 (UTC)
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
	[209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CCEE12F8BFC
	for <cluster-devel@redhat.com>; Wed, 26 Jun 2019 13:17:54 +0000 (UTC)
Received: by mail-oi1-f197.google.com with SMTP id w123so1007089oie.21
	for <cluster-devel@redhat.com>; Wed, 26 Jun 2019 06:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WqdD5BglIz2bjpJLm9xusDo7QNINbb60fVv8fvyF9fM=;
	b=lucsAYjrzQwwTXvzN2BiDbXhIJeCqye2XF/TltVLCS7VQpc8vF+Ucn6HjTehunmTDR
	RbEFVozXiH67IKKu6IUkkBIx7YemukOyBSLnhPkYDeMwtln1Culi3CHPg7W2eFNH2Oqi
	/jQAcfrMWkAxmT2+dcdisZNB2g0v+MNZchhJlP9Wpsrofm0kjpGLDVvxQPDTd17eRCRA
	7gVqEurwvRr1TAOmSD8Xob2DH/KAQz4k6cU2ZB/2wfWgL+SkOIbESo3mqPOamYbU967K
	5hPiUzaT02h0qhp/2nD6tsQ4jwZs7dzMIt/0r9eDmWUcxU9unROnMjSn6ejRCXDO5Pwd
	+Jyw==
X-Gm-Message-State: APjAAAUYyIEOU6RtAMDQSRTmnFG9IlJgW4VBEvVIBemEHfEUs+fXM+oR
	jt3jXoP/la0kodpuUScSr1C56UCT1isIzxTmOwhgpJGAjIQmC4ZpbvZuBVk/GHlTdVP2Z/dhvV7
	HS5sFNRc99IxtfODeD18fqflikvY2KgjKSmtpQg==
X-Received: by 2002:aca:b58b:: with SMTP id e133mr1722192oif.147.1561555074120;
	Wed, 26 Jun 2019 06:17:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy5bRoQuv2KPD9FNgGoEEIj898miACPAEp8kvaWAT78qxVLLGsyqiFSwuc3jqzugKz4zH1MYrfKjHMZGZ9BxOg=
X-Received: by 2002:aca:b58b:: with SMTP id e133mr1722182oif.147.1561555073935;
	Wed, 26 Jun 2019 06:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190626120333.13310-1-agruenba@redhat.com>
	<20190626125502.GB4744@lst.de>
In-Reply-To: <20190626125502.GB4744@lst.de>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 26 Jun 2019 15:17:42 +0200
Message-ID: <CAHc6FU5suCE2-TtNMR4mGZ5DHB+3diVL=uUwccKES=eHwSPYkA@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: cluster-devel@redhat.com
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	cluster-devel <cluster-devel@redhat.com>, linux-xfs@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH 1/2] iomap: don't mark the inode dirty
	in iomap_write_end
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Wed, 26 Jun 2019 13:23:19 +0000 (UTC)

On Wed, 26 Jun 2019 at 14:55, Christoph Hellwig <hch@lst.de> wrote:
> Doesn't the series also need a third patch reducing the amount
> of mark_inode_dirty calls as per your initial proposal?

The page dirtying already reduces from once per page to once per
mapping, so that should be good enough.

Thanks,
Andreas

