Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C7640265F80
	for <lists+cluster-devel@lfdr.de>; Fri, 11 Sep 2020 14:27:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-g0mIVS9sNiKsQ1Nh7aC-FA-1; Fri, 11 Sep 2020 08:27:31 -0400
X-MC-Unique: g0mIVS9sNiKsQ1Nh7aC-FA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA8D289CCEC;
	Fri, 11 Sep 2020 12:27:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE20277D85;
	Fri, 11 Sep 2020 12:27:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF0AB79FF7;
	Fri, 11 Sep 2020 12:27:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08BC95wW015069 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 11 Sep 2020 08:09:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7AB6D201E6AC; Fri, 11 Sep 2020 12:09:05 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74EC4202A97B
	for <cluster-devel@redhat.com>; Fri, 11 Sep 2020 12:09:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12B6B906382
	for <cluster-devel@redhat.com>; Fri, 11 Sep 2020 12:09:03 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-443-xqXUKzGAPcmqphCckj2UXA-1; Fri, 11 Sep 2020 08:08:58 -0400
X-MC-Unique: xqXUKzGAPcmqphCckj2UXA-1
Received: by mail-wr1-f68.google.com with SMTP id t10so11262104wrv.1;
	Fri, 11 Sep 2020 05:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=HG2dGn3UgL48R/VgsGlJdb/1w1XSVMd74NKvmkSF/z4=;
	b=FShX0ALRTtdTMYKWk++Qf+mWuNZ9hpewXWzSLHD/AdH0agvI9aEShwMfy8P9dWTTCy
	O9tzVszeDyKqqcdh8ILSbQCOKQKLNeJpydppxdcxfu7MtVbNnsZLjuMP4h6dnjaeeIUz
	7gMVLZYjpWkdNCvhDQlk8NRol5F4cQ3qJWBAYq5ravZLYT9EPtxyZ9vdUlQtD8KxaRfJ
	JpVQOOFHZUHIqLf1Yes1AyXmSJuWbjIIP6NKlwWUYqHTP4Yb30LpYhMbnBGn5HpoS63w
	idxA7Xtzij4MhGzERhiHDIl9V5glTiicbnV4+S/GR/wiZmx8aFLDEU6KESZb/955JmBw
	8wyQ==
X-Gm-Message-State: AOAM532UxTuQy9fXEPdX4TovfY4IL/KhxdKnAI93cGlydzyCOq/2RxsT
	zobfuLvnET4xxy9oV5WROxWOmAEtzoaT1w==
X-Google-Smtp-Source: ABdhPJwDbgnyvcpG8imVPKItjZfLkRfUwaWkKqNFrq/8QDz/kNEH7ZyY79zS1RnkODM4unDbETNvBA==
X-Received: by 2002:a5d:6cb0:: with SMTP id a16mr1718516wra.88.1599826137029; 
	Fri, 11 Sep 2020 05:08:57 -0700 (PDT)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
	by smtp.gmail.com with ESMTPSA id
	q192sm4330677wme.13.2020.09.11.05.08.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Sep 2020 05:08:55 -0700 (PDT)
Date: Fri, 11 Sep 2020 14:08:54 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20200911120854.GA221663@eldamar.local>
References: <20200623195316.864547658@linuxfoundation.org>
	<20200623195323.968867013@linuxfoundation.org>
	<20200910194319.GA131386@eldamar.local>
	<20200911115816.GB3717176@kroah.com>
MIME-Version: 1.0
In-Reply-To: <20200911115816.GB3717176@kroah.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Fri, 11 Sep 2020 08:27:12 -0400
Cc: Sasha Levin <sashal@kernel.org>, Daniel.Craig@csiro.au,
	Nicolas Courtel <courtel@cena.fr>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, cluster-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg,

Thanks for your quick reply.

On Fri, Sep 11, 2020 at 01:58:16PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Sep 10, 2020 at 09:43:19PM +0200, Salvatore Bonaccorso wrote:
> > Hi,
> > 
> > On Tue, Jun 23, 2020 at 09:57:50PM +0200, Greg Kroah-Hartman wrote:
> > > From: Bob Peterson <rpeterso@redhat.com>
> > > 
> > > [ Upstream commit 83d060ca8d90fa1e3feac227f995c013100862d3 ]
> > > 
> > > Before this patch, transactions could be merged into the system
> > > transaction by function gfs2_merge_trans(), but the transaction ail
> > > lists were never merged. Because the ail flushing mechanism can run
> > > separately, bd elements can be attached to the transaction's buffer
> > > list during the transaction (trans_add_meta, etc) but quickly moved
> > > to its ail lists. Later, in function gfs2_trans_end, the transaction
> > > can be freed (by gfs2_trans_end) while it still has bd elements
> > > queued to its ail lists, which can cause it to either lose track of
> > > the bd elements altogether (memory leak) or worse, reference the bd
> > > elements after the parent transaction has been freed.
> > > 
> > > Although I've not seen any serious consequences, the problem becomes
> > > apparent with the previous patch's addition of:
> > > 
> > > 	gfs2_assert_warn(sdp, list_empty(&tr->tr_ail1_list));
> > > 
> > > to function gfs2_trans_free().
> > > 
> > > This patch adds logic into gfs2_merge_trans() to move the merged
> > > transaction's ail lists to the sdp transaction. This prevents the
> > > use-after-free. To do this properly, we need to hold the ail lock,
> > > so we pass sdp into the function instead of the transaction itself.
> > > 
> > > Signed-off-by: Bob Peterson <rpeterso@redhat.com>
> > > Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
> > > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > ---
> > >  fs/gfs2/log.c | 11 +++++++++--
> > >  1 file changed, 9 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/fs/gfs2/log.c b/fs/gfs2/log.c
> > > index d3f0612e33471..06752db213d21 100644
> > > --- a/fs/gfs2/log.c
> > > +++ b/fs/gfs2/log.c
> > > @@ -877,8 +877,10 @@ void gfs2_log_flush(struct gfs2_sbd *sdp, struct gfs2_glock *gl, u32 flags)
> > >   * @new: New transaction to be merged
> > >   */
> > >  
> > > -static void gfs2_merge_trans(struct gfs2_trans *old, struct gfs2_trans *new)
> > > +static void gfs2_merge_trans(struct gfs2_sbd *sdp, struct gfs2_trans *new)
> > >  {
> > > +	struct gfs2_trans *old = sdp->sd_log_tr;
> > > +
> > >  	WARN_ON_ONCE(!test_bit(TR_ATTACHED, &old->tr_flags));
> > >  
> > >  	old->tr_num_buf_new	+= new->tr_num_buf_new;
> > > @@ -890,6 +892,11 @@ static void gfs2_merge_trans(struct gfs2_trans *old, struct gfs2_trans *new)
> > >  
> > >  	list_splice_tail_init(&new->tr_databuf, &old->tr_databuf);
> > >  	list_splice_tail_init(&new->tr_buf, &old->tr_buf);
> > > +
> > > +	spin_lock(&sdp->sd_ail_lock);
> > > +	list_splice_tail_init(&new->tr_ail1_list, &old->tr_ail1_list);
> > > +	list_splice_tail_init(&new->tr_ail2_list, &old->tr_ail2_list);
> > > +	spin_unlock(&sdp->sd_ail_lock);
> > >  }
> > >  
> > >  static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
> > > @@ -901,7 +908,7 @@ static void log_refund(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
> > >  	gfs2_log_lock(sdp);
> > >  
> > >  	if (sdp->sd_log_tr) {
> > > -		gfs2_merge_trans(sdp->sd_log_tr, tr);
> > > +		gfs2_merge_trans(sdp, tr);
> > >  	} else if (tr->tr_num_buf_new || tr->tr_num_databuf_new) {
> > >  		gfs2_assert_withdraw(sdp, test_bit(TR_ALLOCED, &tr->tr_flags));
> > >  		sdp->sd_log_tr = tr;
> > > -- 
> > > 2.25.1
> > 
> > In Debian two user confirmed issues on writing on a GFS2 partition
> > with this commit applied. The initial Debian report is at
> > https://bugs.debian.org/968567 and Daniel Craig reported it into
> > Bugzilla at https://bugzilla.kernel.org/show_bug.cgi?id=209217 .
> > 
> > Writing to a gfs2 filesystem fails and results in a soft lookup of the
> > machine for kernels with that commit applied. I cannot reporduce the
> > issue myself due not having a respective setup available, but Daniel
> > described a minimal serieos of steps to reproduce the issue.
> > 
> > This might affect as well other stable series where this commit was
> > applied, as there was a similar report for someone running 5.4.58 in
> > https://www.redhat.com/archives/linux-cluster/2020-August/msg00000.html
> 
> Can you report this to the gfs2 developers?

Sure! Bob Peterson and Andreas Gruenbacher were already on the
recipient list but I forgot cluster-devel@redhat.com .

I can send there a separate report as followup if still needed.

Regards,
Salvatore

