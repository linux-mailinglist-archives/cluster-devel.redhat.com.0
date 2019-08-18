Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D13991946
	for <lists+cluster-devel@lfdr.de>; Sun, 18 Aug 2019 21:32:09 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 193C6C049E10;
	Sun, 18 Aug 2019 19:32:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE7BD5FCA3;
	Sun, 18 Aug 2019 19:32:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D60B318005B9;
	Sun, 18 Aug 2019 19:32:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7IJVpSl004904 for <cluster-devel@listman.util.phx.redhat.com>;
	Sun, 18 Aug 2019 15:31:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DDC111CF; Sun, 18 Aug 2019 19:31:51 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DFF3871CE;
	Sun, 18 Aug 2019 19:31:49 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9079530917EF;
	Sun, 18 Aug 2019 19:31:48 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id j15so11778130qtl.13;
	Sun, 18 Aug 2019 12:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mh5jr1rScriFxNzOWMaKI7sY0Xc2P0AIAoBRXShh9Rg=;
	b=JSkQKcuRLUJ6Z2UGo/rGlOjzDTBC+G0K3ubTE5gScuRCOtB8aZv33K3S/pyVqJJ2GZ
	q9EaNHPwYfbhJR5fx20b4ET7nhJtNWALlR0pPiV0Nm2sD3n8SQHJErZgtJE3EIWY3BcY
	pfsSfjxP1qN8Y6Q7tvxQweYMExtOBmmjDT/lK+f5Ra4imvTiAQfHtlIJTyHEue0Qpq9C
	q9Q/UO8u+kr25TrgNGakGUxFd7lah2kkhJDJyZKUoZaOng05YkjeibRH/DpGpG28W6ji
	t7bU5p4lPFiW/4cQbe9lKdpHovTYUpzkxMXFxflzCeq7J+Ky9ADCCy7ArqAVn6EtBopY
	bWHA==
X-Gm-Message-State: APjAAAWEQdsqTOrQo9cuW2G7k+rYKyTVAfZjPetddm4XnGkDnVTX5gq5
	7OOH2k0OLBuDxmfgHtVVb+bOrEMbmzNMh28av8IV/v67mjM=
X-Google-Smtp-Source: APXvYqzz3AewI020l+nDXpUq+OQWStAhNnUt/bcyf6+mtzqDW/h8VdaaJlYz7EUAiQl8ug0PnJYJPjQg2gEgg+FtrXk=
X-Received: by 2002:ad4:4b0c:: with SMTP id r12mr7996213qvw.45.1566156707449; 
	Sun, 18 Aug 2019 12:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190814204259.120942-1-arnd@arndb.de>
	<20190814204259.120942-4-arnd@arndb.de>
	<CAHc6FU5n9rBZuH=chOdmGCwyrX-B-Euq8oFrnu3UHHKSm5A5gQ@mail.gmail.com>
In-Reply-To: <CAHc6FU5n9rBZuH=chOdmGCwyrX-B-Euq8oFrnu3UHHKSm5A5gQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 18 Aug 2019 21:31:31 +0200
Message-ID: <CAK8P3a3kiyytayaSs2LB=deK0OMs42Ayn4VErhjL6eM3FTGtpw@mail.gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Sun, 18 Aug 2019 19:31:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Sun, 18 Aug 2019 19:31:48 +0000 (UTC) for IP:'209.85.160.193'
	DOMAIN:'mail-qt1-f193.google.com'
	HELO:'mail-qt1-f193.google.com' FROM:'arndbergmann@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.502  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.160.193 mail-qt1-f193.google.com 209.85.160.193
	mail-qt1-f193.google.com <arndbergmann@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: cluster-devel@redhat.com
Cc: Jan Kara <jack@suse.cz>, "Darrick J. Wong" <darrick.wong@oracle.com>,
	LKML <linux-kernel@vger.kernel.org>, NeilBrown <neilb@suse.com>,
	cluster-devel <cluster-devel@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>
Subject: Re: [Cluster-devel] [PATCH v5 03/18] gfs2: add compat_ioctl support
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Sun, 18 Aug 2019 19:32:07 +0000 (UTC)

On Fri, Aug 16, 2019 at 7:32 PM Andreas Gruenbacher <agruenba@redhat.com> wrote:
>
> On Wed, Aug 14, 2019 at 10:45 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > +       /* These are just misnamed, they actually get/put from/to user an int */
> > +       switch(cmd) {
> > +       case FS_IOC32_GETFLAGS:
> > +               cmd = FS_IOC_GETFLAGS;
> > +               break;
> > +       case FS_IOC32_SETFLAGS:
> > +               cmd = FS_IOC_SETFLAGS;
> > +               break;
>
> I'd like the code to be more explicit here:
>
>         case FITRIM:
>         case FS_IOC_GETFSLABEL:
>               break;
>         default:
>               return -ENOIOCTLCMD;

I've looked at it again: if we do this, the function actually becomes
longer than
the native gfs2_ioctl(). Should we just make a full copy then?

static long gfs2_compat_ioctl(struct file *filp, unsigned int cmd,
unsigned long arg)
{
        switch(cmd) {
        case FS_IOC32_GETFLAGS:
                return gfs2_get_flags(filp, (u32 __user *)arg);
        case FS_IOC32_SETFLAGS:
                return gfs2_set_flags(filp, (u32 __user *)arg);
        case FITRIM:
                return gfs2_fitrim(filp, (void __user *)arg);
        case FS_IOC_GETFSLABEL:
                return gfs2_getlabel(filp, (char __user *)arg);
        }

        return -ENOTTY;
}

> Should we feed this through the gfs2 tree?

A later patch that removes the FITRIM handling from fs/compat_ioctl.c
depends on it, so I'd like to keep everything together.

         Arnd

