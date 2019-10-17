Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB18DAB21
	for <lists+cluster-devel@lfdr.de>; Thu, 17 Oct 2019 13:25:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F2FA155E0;
	Thu, 17 Oct 2019 11:25:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BAF360BE1;
	Thu, 17 Oct 2019 11:25:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E0DCE4EE68;
	Thu, 17 Oct 2019 11:25:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9HB2XeI023503 for <cluster-devel@listman.util.phx.redhat.com>;
	Thu, 17 Oct 2019 07:02:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1D7E05C231; Thu, 17 Oct 2019 11:02:33 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79FA25C290;
	Thu, 17 Oct 2019 11:02:30 +0000 (UTC)
Received: from imap1.codethink.co.uk (imap1.codethink.co.uk [176.9.8.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE4BF30832C0;
	Thu, 17 Oct 2019 11:02:28 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
	by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
	id 1iL3Y3-0002YT-Ar; Thu, 17 Oct 2019 12:02:27 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
	(envelope-from <ben@rainbowdash.codethink.co.uk>)
	id 1iL3Y2-00082E-TZ; Thu, 17 Oct 2019 12:02:26 +0100
From: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Date: Thu, 17 Oct 2019 12:02:25 +0100
Message-Id: <20191017110225.30841-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.44]); Thu, 17 Oct 2019 11:02:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Thu, 17 Oct 2019 11:02:29 +0000 (UTC) for IP:'176.9.8.82'
	DOMAIN:'imap1.codethink.co.uk' HELO:'imap1.codethink.co.uk'
	FROM:'ben@codethink.co.uk' RCPT:''
X-RedHat-Spam-Score: -0.002  (RCVD_IN_DNSWL_NONE, SPF_HELO_PASS,
	SPF_PASS) 176.9.8.82 imap1.codethink.co.uk 176.9.8.82
	imap1.codethink.co.uk <ben@codethink.co.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: cluster-devel@redhat.com
X-Mailman-Approved-At: Thu, 17 Oct 2019 07:25:19 -0400
Cc: cluster-devel@redhat.com,
	"Ben Dooks \(Codethink\)" <ben.dooks@codethink.co.uk>,
	linux-kernel@vger.kernel.org
Subject: [Cluster-devel] [PATCH] gfs2: make gfs2_fs_parameters static
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Thu, 17 Oct 2019 11:25:46 +0000 (UTC)

The gfs2_fs_parameters is not used outside the unit
it is declared in, so make it static.

Fixes the following sparse warning:

fs/gfs2/ops_fstype.c:1331:39: warning: symbol 'gfs2_fs_parameters' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Bob Peterson <rpeterso@redhat.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>
Cc: cluster-devel@redhat.com
Cc: linux-kernel@vger.kernel.org
---
 fs/gfs2/ops_fstype.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/gfs2/ops_fstype.c b/fs/gfs2/ops_fstype.c
index 681b44682b0d..ebdef1c5f580 100644
--- a/fs/gfs2/ops_fstype.c
+++ b/fs/gfs2/ops_fstype.c
@@ -1328,7 +1328,7 @@ static const struct fs_parameter_enum gfs2_param_enums[] = {
 	{}
 };
 
-const struct fs_parameter_description gfs2_fs_parameters = {
+static const struct fs_parameter_description gfs2_fs_parameters = {
 	.name = "gfs2",
 	.specs = gfs2_param_specs,
 	.enums = gfs2_param_enums,
-- 
2.23.0

