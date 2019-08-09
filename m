Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E1D873CD
	for <lists+cluster-devel@lfdr.de>; Fri,  9 Aug 2019 10:10:21 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB526308C21D;
	Fri,  9 Aug 2019 08:10:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0233360BF3;
	Fri,  9 Aug 2019 08:10:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BEDCB18005B9;
	Fri,  9 Aug 2019 08:10:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x798ACMv009112 for <cluster-devel@listman.util.phx.redhat.com>;
	Fri, 9 Aug 2019 04:10:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BBCE660BF4; Fri,  9 Aug 2019 08:10:12 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B617360BF3
	for <cluster-devel@redhat.com>; Fri,  9 Aug 2019 08:10:12 +0000 (UTC)
Received: from wblock1.skku.edu (wblock1.skku.ac.kr [115.145.128.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 540304F1B2
	for <cluster-devel@redhat.com>; Fri,  9 Aug 2019 08:10:10 +0000 (UTC)
Received: from ptmsg2.skku.edu ( [115.145.128.200])
	by wblock1.skku.edu (DEEPSoft WBlock.s.h 5.04.499)
	with ESMTP id <OFA15B94C2.57C7D335-ON49258451.002CE1A7@skku.ac.kr>
	for <cluster-devel@redhat.com>; Fri, 9 Aug 2019 17:10:08 +0900
Received: from mail3.skku.edu ([115.145.128.194])
	by ptmsg2.skku.edu (IBM Domino Release 9.0.1FP10)
	with ESMTP id 2019080917141476-1748089 ;
	Fri, 9 Aug 2019 17:14:14 +0900 
From: "=?EUC-KR?B?x9G067HU?=" <hdg9400@skku.edu>
To: cluster-devel@redhat.com
Importance: Normal
Sensitivity: 
Date: Fri, 9 Aug 2019 17:10:13 +0900
X-MIMETrack: Itemize by http on ptmail3/skku(Release 9.0.1FP10HF193 | April 16,
	2018) at 2019-08-09 17:10:13,
	Serialize by Router on ptmail3/skku(Release 9.0.1FP10HF193 | April 16,
	2018) at 2019-08-09 17:10:13,
	Serialize complete at 2019-08-09 17:10:13,
	Itemize by SMTP Server on ptmsg2/skku(Release 9.0.1FP10|January  15,
	2018) at 2019-08-09 17:14:14,
	Serialize by Router on ptmsg2/skku(Release 9.0.1FP10|January  15,
	2018) at 2019-08-09 17:14:14,
	Serialize complete at 2019-08-09 17:14:14
Message-ID: <OFA15B94C2.57C7D335-ON49258451.002CE1A7@skku.ac.kr>
X-ematesmtpid: A15B94C257C7D33549258451002CE1A7
MIME-Version: 1.0
X-TNEFEvaluated: 1
Content-Transfer-Encoding: base64
X-WB-RES: 0: str=0001.0A15020D.5D4D29D9.0029, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
Content-Type: text/html; charset="utf-8"
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.26]); Fri, 09 Aug 2019 08:10:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Fri, 09 Aug 2019 08:10:11 +0000 (UTC) for IP:'115.145.128.245'
	DOMAIN:'wblock1.skku.ac.kr' HELO:'wblock1.skku.edu'
	FROM:'hdg9400@skku.edu' RCPT:''
X-RedHat-Spam-Score: 1.742 * (FROM_EXCESS_BASE64, HTML_IMAGE_ONLY_12,
	HTML_IMAGE_RATIO_08, HTML_MESSAGE, MIME_HTML_ONLY,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	T_REMOTE_IMAGE) 115.145.128.245 wblock1.skku.ac.kr 115.145.128.245
	wblock1.skku.ac.kr <hdg9400@skku.edu>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: cluster-devel@redhat.com
Subject: [Cluster-devel] How can be metadata(e.g.,
 inode) in the GFS2 file system shared between client nodes?
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Fri, 09 Aug 2019 08:10:20 +0000 (UTC)

PGh0bWw+PGhlYWQ+PHN0eWxlIHR5cGU9InRleHQvY3NzIiBpZD0iTmFtb1NFX19HZW5lcmFsU3R5
bGUiPiBib2R5e2ZvbnQtZmFtaWx5IDrrj4vsm4A7IGNvbG9yIDogIzAwMDAwMDsgZm9udC1zaXpl
IDogMTBwdDsgd29yZC1XcmFwIDogYnJlYWstd29yZDsgbWFyZ2luIDogN3B4IDAgMCA3cHg7fSBw
LGxpe2xpbmUtaGVpZ2h0OjEuMjsgIHdvcmQtd3JhcDogYnJlYWstd29yZDsgbWFyZ2luLXRvcDow
OyBtYXJnaW4tYm90dG9tOjA7fSBib2R5e292ZXJmbG93OmF1dG87fS5OYW1vU0VfbGF5b3V0bG9j
a19zaG93IHsgd29yZC1icmVhazogYnJlYWstYWxsO308L3N0eWxlPjxsaW5rIHR5cGU9InRleHQv
Y3NzIiByZWw9InN0eWxlc2hlZXQiIGhyZWY9Ii9nd19yZXNvdXJjZS9jc3MvbmFtb19iYXNpYy5j
c3MiPjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0idGV4dC9odG1sOyBj
aGFyc2V0PXV0Zi04Ij48L2hlYWQ+PGJvZHkgY2xhc3M9IiI+PHA+SGksIEknbSBEYWVneXUgZnJv
bSBTdW5na3l1bmt3YW4gVW5pdmVyc2l0eS48L3A+PHA+PGJyPjwvcD48cD5JJ20gY3VyaW91cyBo
b3cgR0ZTMidzIGZpbGVzeXN0ZW0gbWV0YWRhdGEgaXMgc2hhcmVkIGJldHdlZW4gbm9kZXMuPC9w
PjxwPjxicj48L3A+PHA+SW4gZGV0YWlsLCBJIHdvbmRlciBob3cgdGhlIG1ldGFkYXRhIGluIHRo
ZSBtZW1vcnkgb2YgdGhlIG5vZGUgbW91bnRpbmcgR0ZTMiBsb29rcyB0aGUgY29uc2lzdGVudCBm
aWxlc3lzdGVtJm5ic3A7dG8gb3RoZXIgbm9kZXMuPC9wPjxwPjxicj48L3A+PHA+SW4gYWRkaXRp
b24sIHdoYXQgcm9sZSBkb2VzIGNvcm9zeW5jIHBsYXkgaW4gZ2ZzMj88L3A+PHA+PGJyPjwvcD48
cD5UaGFuayB5b3UsPC9wPjxwPkRhZWd5dTwvcD48cD48YnI+PC9wPjxkaXYgbmFtZT0iZ3dTaWdu
Ij4mbmJzcDs8L2Rpdj48cD48YnI+PC9wPjxpbWcgc3JjPSJodHRwOi8vcHRtc2cuc2trdS5lZHUv
ZW1hdGVfYXBwL2VtYXRlbWRuLm5zZi9tZG5mb3JtP09wZW5Gb3JtJnNlbmRlcj1oZGc5NDAwQHNr
a3UuZWR1JnJlY2VpdmVyPWNsdXN0ZXItZGV2ZWxAcmVkaGF0LmNvbSZrZXk9QTE1Qjk0QzI1N0M3
RDMzNTQ5MjU4NDUxMDAyQ0UxQTciIHdpZHRoPTAgaGVpZ2h0PTAgYm9yZGVyPTA+PC9ib2R5Pjwv
aHRtbD4=

