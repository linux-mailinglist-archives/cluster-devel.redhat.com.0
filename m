Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD87CC187
	for <lists+cluster-devel@lfdr.de>; Fri,  4 Oct 2019 19:22:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8620E8980E5;
	Fri,  4 Oct 2019 17:22:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1455D1001DC0;
	Fri,  4 Oct 2019 17:22:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B7A481808876;
	Fri,  4 Oct 2019 17:22:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x94HMAJR005142 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 4 Oct 2019 13:22:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 630D260BF7; Fri,  4 Oct 2019 17:22:10 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E23760BE1
	for <cluster-devel@redhat.com>; Fri,  4 Oct 2019 17:22:07 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF45A4EE68;
	Fri,  4 Oct 2019 17:22:07 +0000 (UTC)
Date: Fri, 4 Oct 2019 13:22:07 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: aliasgar surti500 <aliasgar.surti500@gmail.com>
Message-ID: <312248413.4882810.1570209727854.JavaMail.zimbra@redhat.com>
In-Reply-To: <1944905967.4863703.1570204154537.JavaMail.zimbra@redhat.com>
References: <20191002174631.15919-1-aliasgar.surti500@gmail.com>
	<1944905967.4863703.1570204154537.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.3.116.219, 10.4.195.17]
Thread-Topic: gfs2: removed unnecessary semicolon
Thread-Index: 5pT+PabUEhpG6HUEs4rjxCBeLgtPV2X/eonn
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org
Subject: Re: [Cluster-devel] [PATCH] gfs2: removed unnecessary semicolon
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]); Fri, 04 Oct 2019 17:22:12 +0000 (UTC)

----- Original Message -----
> ----- Original Message -----
> > From: Aliasgar Surti <aliasgar.surti500@gmail.com>
> > 
> > There is use of unnecessary semicolon after switch case.
> > Removed the semicolon.
> > 
> > Signed-off-by: Aliasgar Surti <aliasgar.surti500@gmail.com>
> > ---
> >  fs/gfs2/recovery.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
> > index c529f8749a89..f4aa8551277b 100644
> > --- a/fs/gfs2/recovery.c
> > +++ b/fs/gfs2/recovery.c
> > @@ -326,7 +326,7 @@ void gfs2_recover_func(struct work_struct *work)
> >  
> >  		default:
> >  			goto fail;
> > -		};
> > +		}
> >  
> >  		error = gfs2_glock_nq_init(ip->i_gl, LM_ST_SHARED,
> >  					   LM_FLAG_NOEXP | GL_NOCACHE, &ji_gh);
> > --
> > 2.17.1
> 
> Hi,
> 
> Thanks for the patch. I did a quick search and found two more:
> 
> glops.c-                break;
> glops.c:        };
> 
> inode.c-                        goto out_gunlock;
> inode.c:                };
> 
> Do you want to include those in your patch and re-submit it or
> should I cook up a second patch?

Hi,

I just went ahead and added the two above to your patch and pushed
it to for-next. Thanks.

Regards,

Bob Peterson

