Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8BCA86C1
	for <lists+cluster-devel@lfdr.de>; Wed,  4 Sep 2019 18:59:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8AA283D94D;
	Wed,  4 Sep 2019 16:59:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E289060C18;
	Wed,  4 Sep 2019 16:59:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 92DFB2551C;
	Wed,  4 Sep 2019 16:59:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x84GxHYK032143 for <cluster-devel@listman.util.phx.redhat.com>;
	Wed, 4 Sep 2019 12:59:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 78E786060D; Wed,  4 Sep 2019 16:59:17 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB4B06092F;
	Wed,  4 Sep 2019 16:59:14 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E30611800B74;
	Wed,  4 Sep 2019 16:59:14 +0000 (UTC)
Date: Wed, 4 Sep 2019 12:59:14 -0400 (EDT)
From: Bob Peterson <rpeterso@redhat.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <1215047977.12665709.1567616354680.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAHc6FU49bXX7GoNeO3eNex+wVjEecYfQjySCy1EbTL2ek+tUzg@mail.gmail.com>
References: <20190523130421.21003-1-rpeterso@redhat.com>
	<20190523130421.21003-12-rpeterso@redhat.com>
	<CAHc6FU49bXX7GoNeO3eNex+wVjEecYfQjySCy1EbTL2ek+tUzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.3.116.191, 10.4.195.12]
Thread-Topic: gfs2: log error reform
Thread-Index: +jMNkeIFslUdMAkndMxlXIJsQnDZnw==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: cluster-devel@redhat.com
Cc: cluster-devel <cluster-devel@redhat.com>
Subject: Re: [Cluster-devel] [GFS2 PATCH v6 11/26] gfs2: log error reform
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Wed, 04 Sep 2019 16:59:23 +0000 (UTC)

Hi Andreas,

----- Original Message -----
> > +                */
> > +               if (sdp->sd_log_error) {
> > +                       gfs2_io_error_bh(sdp, bh);
> 
> some of the error handling here is still sketchy: the only place where
> sd_log_error is set without withdrawing the filesystem is
> quotad_error. If the filesystem has already been marked
> SDF_WITHDRAWING or SDF_WITHDRAWN, gfs2_io_error_bh will be a no-op. It
> seems that we want to set SDF_WITHDRAWING here for the quotad_error
> case instead of calling gfs2_io_error_bh?
> 
> > +               } else if (buffer_busy(bh)) {
> >                         continue;
> > -               if (!buffer_uptodate(bh) &&
> > -                   !test_and_set_bit(SDF_AIL1_IO_ERROR, &sdp->sd_flags)) {
> > +               } else if (!buffer_uptodate(bh) &&
> > +                          !cmpxchg(&sdp->sd_log_error, 0, -EIO)) {
> >                         gfs2_io_error_bh(sdp, bh);
> >                         set_bit(SDF_WITHDRAWING, &sdp->sd_flags);
> >                 }

The main idea was to move busy buffers to tr_ail2_list after
an errors have been flagged (before the test for buffer_busy()).
Would something like this be more acceptable?

@@ -200,10 +199,19 @@ static void gfs2_ail1_empty_one(struct gfs2_sbd *sdp, struct gfs2_trans *tr)
 					 bd_ail_st_list) {
 		bh = bd->bd_bh;
 		gfs2_assert(sdp, bd->bd_tr == tr);
-		if (buffer_busy(bh))
+		/*
+		 * If another process flagged an io error, e.g. writing to the
+		 * journal, error all other bhs and move them off the ail1 to
+		 * prevent a tight loop when unmount tries to flush ail1,
+		 * regardless of whether they're still busy. If no outside
+		 * errors were found and the buffer is busy, move to the next.
+		 * If the ail buffer is not busy and caught an error, flag it
+		 * for others.
+		 */
+		if (!sdp->sd_log_error && buffer_busy(bh))
 			continue;
 		if (!buffer_uptodate(bh) &&
-		    !test_and_set_bit(SDF_AIL1_IO_ERROR, &sdp->sd_flags)) {
+		    !cmpxchg(&sdp->sd_log_error, 0, -EIO)) {
 			gfs2_io_error_bh(sdp, bh);
 			set_bit(SDF_WITHDRAWING, &sdp->sd_flags);
 		}



Regards,

Bob Peterson

