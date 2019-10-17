Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A601DB863
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Oct 2019 22:40:49 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 74DDF18B20E8;
	Thu, 17 Oct 2019 20:40:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4572D60623;
	Thu, 17 Oct 2019 20:40:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 47E834EE68;
	Thu, 17 Oct 2019 20:40:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9HKXN72014595 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 17 Oct 2019 16:33:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A6CA15C231; Thu, 17 Oct 2019 20:33:23 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from rh (ovpn-116-75.phx2.redhat.com [10.3.116.75])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35A245C290;
	Thu, 17 Oct 2019 20:33:21 +0000 (UTC)
Received: from [::1] (helo=rh)
	by rh with esmtps (TLSv1.3:TLS_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <dchinner@redhat.com>)
	id 1iLCSR-0000uk-OV; Fri, 18 Oct 2019 07:33:15 +1100
Date: Fri, 18 Oct 2019 07:33:12 +1100
From: Dave Chinner <dchinner@redhat.com>
To: "Hayes, Bill" <bill.hayes@hpe.com>
Message-ID: <20191017203312.GK25485@rh>
References: <AT5PR8401MB1025DFAE60F5A5A4BCC5D2038B940@AT5PR8401MB1025.NAMPRD84.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AT5PR8401MB1025DFAE60F5A5A4BCC5D2038B940@AT5PR8401MB1025.NAMPRD84.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
Cc: "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
	"ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>
Subject: Re: [Cluster-devel] Interest in DAX for OCFS2 and/or GFS2?
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Thu, 17 Oct 2019 20:40:47 +0000 (UTC)

On Thu, Oct 10, 2019 at 04:41:56PM +0000, Hayes, Bill wrote:
> Has there been any discussion or interest in DAX support in OCFS2?
> Is there interest from the OCFS2 development community to see DAX support developed and put upstream?
> 
> Has there been any discussion or interest in DAX support in GFS2?
> Is there interest from the GFS2 development community to see DAX support developed and put upstream?

You're probably best from a DAX implementation POV to head down the
GFS2 path, as FS-DAX requires the filesystem to use the fs/iomap/
extent mapping implementation. GFS2 is already partially ported to
use the iomap infrastructure, though more work is needed to provide
the iomap functionality DAX requires. OCFS2 would require a lot more
work on this front....

Cheers,

Dave.
-- 
Dave Chinner
dchinner@redhat.com

